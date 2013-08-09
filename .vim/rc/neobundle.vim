" シェルの位置を元に戻す
if is_office
    set shell=/bin/sh
elseif is_win
    set shell=$SYSTEMROOT\system32\cmd.exe
endif

" NeoBundle 設定開始
set nocompatible

" プラグイン保存パス
let g:bundle_dir = g:home . '/.vim/bundle'
let g:neobundle_dir = g:bundle_dir . '/neobundle.vim'

" デフォルトプロトコル
let g:neobundle#types#git#default_protocol='https'

" NeoBundle へのパス
if has('vim_starting')
    if is_office
        set runtimepath-=$HOME/.vim
    endif
    execute 'set runtimepath+=' . g:neobundle_dir . '/'
endif

call neobundle#rc(expand(g:bundle_dir))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Set vimproc
NeoBundle 'Shougo/vimproc', {'build': {
    \   'cygwin': 'make -f make_cygwin.mak',
    \   'mac': 'make -f make_mac.mak',
    \   'unix': 'make -f make_unix.mak',
    \   },
    \ }

" プラグイン（github） {{{
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'amdt/sunset'
NeoBundle 'delphinus35/unite-converter-erase-diff-buffer'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'gregsexton/VimCalc'
NeoBundle 'gregsexton/gitv'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'jceb/vim-hier'
NeoBundle 'jelera/vim-gummybears-colorscheme'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'kannokanno/unite-dwm'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'noahfrederick/Hemisu'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/unite-qfixhowm'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'rainux/vim-desert-warm-256'
NeoBundle 'sjl/badwolf'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/HiColors'
NeoBundle 'vim-scripts/LineJuggler'
NeoBundle 'vim-scripts/colorizer'

"NeoBundle 'AndrewRadev/splitjoin.vim'
"NeoBundle 'Rykka/trans.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'bcat/abbott.vim'
"NeoBundle 'bling/vim-bufferline'
"NeoBundle 'chikatoike/activefix.vim'
"NeoBundle 'chreekat/vim-paren-crosshairs'
"NeoBundle 'dannyob/quickfixstatus'
"NeoBundle 'delphinus35/activefix.vim'
"NeoBundle 'delphinus35/clam.vim'
"NeoBundle 'delphinus35/vim-pastefire'
"NeoBundle 'fbueno/cospe.vim'
"NeoBundle 'fuenor/vim-make-syntax'
"NeoBundle 'gcmt/breeze.vim'
"NeoBundle 'gcmt/plum.vim'
"NeoBundle 'gcmt/psearch.vim'
"NeoBundle 'gcmt/taboo.vim'
"NeoBundle 'godlygeek/csapprox'
"NeoBundle 'gokcehan/vim-yacom'
"NeoBundle 'hobbestigrou/vimtips-fortune'
"NeoBundle 'int3/vim-extradite'
"NeoBundle 'itchyny/thumbnail.vim'
"NeoBundle 'joonty/vdebug'
"NeoBundle 'kana/vim-textobj-indent'
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'khorser/vim-qfnotes'
"NeoBundle 'koron/chalice'
"NeoBundle 'kshenoy/vim-origami'
"NeoBundle 'mihaifm/bck'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'othree/javascript-libraries-syntax.vim'
"NeoBundle 'roman/golden-ratio'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'sjl/clam.vim'
"NeoBundle 'terryma/vim-expand-region'
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'thinca/vim-tabrecent'
"NeoBundle 'tomtom/tinykeymap_vim'
"NeoBundle 'tpope/vim-characterize'
"NeoBundle 'tpope/vim-eunuch'
"NeoBundle 'tpope/vim-sleuth'
"NeoBundle 'tpope/vim-unimpaired'
"NeoBundle 'troydm/asyncfinder.vim'
"NeoBundle 'troydm/easybuffer.vim'
"NeoBundle 'tyru/current-func-info.vim'
"NeoBundle 'vim-scripts/Colour-Sampler-Pack'
"NeoBundle 'vim-scripts/DrawIt'
"NeoBundle 'vim-scripts/ExplainPattern'
"NeoBundle 'vim-scripts/ZoomWin'
"NeoBundle 'vim-scripts/cmdline-completion'
"NeoBundle 'vim-scripts/sudo.vim'
"NeoBundle 'vim-scripts/vmark.vim--Visual-Bookmarking'
"NeoBundle 'ynkdir/vim-funlib'
"NeoBundle 'yuratomo/gmail.vim'
" }}}

" 後で読み込む {{{
NeoBundleLazy 'rkitover/vimpager'
NeoBundleLazy 'scrooloose/nerdtree'

" Mac 専用
if has('macunix')
    NeoBundle 'msanders/cocoa.vim'
    NeoBundle 'troydm/pb.vim'
else
    NeoBundleLazy 'msanders/cocoa.vim'
    NeoBundleLazy 'troydm/pb.vim'
endif

" CSS
NeoBundleLazy 'ChrisYip/Better-CSS-Syntax-for-Vim'
autocmd FileType css NeoBundleSource Better-CSS-Syntax-for-Vim

" CSV
NeoBundleLazy 'csv.vim'
autocmd FileType csv NeoBundleSource csv.vim

" Perl
NeoBundleLazy 'c9s/perlomni.vim'
NeoBundleLazy 'rkitover/perl-vim-mxd'
"NeoBundleLazy 'petdance/vim-perl'
function s:open_perl()
    NeoBundleSource perlomni
    NeoBundleSource perl-vim-mxd
endfunction
autocmd FileType perl call s:open_perl()

" Chalice
NeoBundleLazy 'delphinus35/chalice'
command! EnableChalice :NeoBundleSource chalice

" Twitter
NeoBundleLazy 'basyura/TweetVim', {'depends': [
    \   'basyura/bitly.vim',
    \   'basyura/twibill.vim',
    \   'tyru/open-browser.vim',
    \ ]}
command! EnableTwitter :NeoBundleSource TweetVim
" }}}

if has('vim_starting')
    if is_win
        set runtimepath+=~/vimfiles/
    elseif is_remora || is_office_cygwin
        set runtimepath+=~/.vim/
    elseif is_office
        set runtimepath^=$H/.vim/
    endif
endif

filetype plugin indent on
syntax on
NeoBundleCheck

" vim:se et fdm=marker:
