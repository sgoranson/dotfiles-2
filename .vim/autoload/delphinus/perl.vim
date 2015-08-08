let s:V = vital#of('vital')
let s:P = s:V.import('Prelude')

let s:carton = expand('/usr/local/opt/plenv/shims/carton')
let s:local_perl = expand('$HOME/git/dotfiles/bin/local_perl.sh')
let s:cpanfile = 'cpanfile'
let s:print_perlpath = " -e 'print join(q/,/,@INC)'"

function! delphinus#perl#manage_local_perl(path) abort
  let pwd = s:P.path2project_directory(a:path)
  let cache_key = 'perl_cache'
  let memory_perl_cache = delphinus#cache#memory().get(cache_key, {})
  if has_key(memory_perl_cache, pwd)
    return memory_perl_cache[pwd]
  endif

  let perl_cache = delphinus#cache#file().get(cache_key, {})

  if ! has_key(perl_cache, pwd)

    " plenv with carton
    if filereadable(s:cpanfile) && executable(s:carton)
      let local_perl = s:carton . ' exec -- perl'

    " plenv without carton
    elseif executable('plenv')
      let local_perl = systemlist('plenv which perl')[0]

    " perlbrew
    elseif filereadable(expand('$HOME/perl5/perlbrew/etc/bashrc'))
      let local_perl = systemlist('source $HOME/perl5/perlbrew/etc/bashrc && which perl')[0]

    " local_perl
    elseif executable(s:local_perl)
      let local_perl = system(s:local_perl . ' ' . pwd)
      let cmdopt = '-Iapp/lib -Iapp/t/lib -Iapp/extlib/lib/perl5 -Iapp/extlib/lib/perl5/i386-linux-thread-multi'

    " other
    else
      let local_perl = 'perl'
    endif

    let perlpath   = systemlist(local_perl . s:print_perlpath)[0]
    let perl_cache[pwd] = {'local_perl': local_perl, 'perlpath': perlpath}
    if exists('cmdopt')
      let perl_cache[pwd].cmdopt = cmdopt
    endif
    call delphinus#cache#file().set(cache_key, perl_cache)
  endif

  call delphinus#cache#memory().set(cache_key, perl_cache)

  if ! exists('g:quickrun_config')
    let g:quickrun_config = {}
  endif

  let g:perlpath = perl_cache[pwd].perlpath
  let g:quickrun_config['watchdogs_checker/perl'].command = perl_cache[pwd].local_perl
  let g:quickrun_config['watchdogs_checker/perl'].cmdopt = get(perl_cache[pwd], 'cmdopt', '-Ilib -It/lib')
endfunction