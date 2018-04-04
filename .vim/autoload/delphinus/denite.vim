function! delphinus#denite#with_pwd(action) abort
  let l:pwd = get(b:, '__pwd__', '')
  if a:action ==# 'grep'
    call denite#start([{'name': 'grep', 'args': [l:pwd, '', '!']}])
  else
    call denite#start([{'name': a:action, 'args': ['', l:pwd]}])
  endif
endfunction

function! delphinus#denite#file_rec_goroot() abort
  if !executable('go')
    echoerr '`go` executable not found'
    return
  endif
  let l:out = system('go env | grep ''^GOROOT='' | cut -d\" -f2')
  let l:goroot = substitute(l:out, '\n', '', '')
  call denite#start(
        \ [{'name': 'file_rec', 'args': [l:goroot]}],
        \ {'input': '.go '})
endfunction
