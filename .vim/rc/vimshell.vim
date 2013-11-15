"-----------------------------------------------------------------------------
" VimShell
" プロンプトにカレントディレクトリを表示
let g:vimshell_user_prompt = 'getcwd()'
" 初期化ファイルの場所を指定
let g:vimshell_vimshrc_path = g:vim_home . '/vimshrc' . (has('macunix') ? '.mac' : '')
" 履歴ファイルなどの場所を指定
let g:vimshell_temporary_directory = g:home . '/.vimshell'
" 大文字小文字を区別しない？
let g:vimshell_enable_smart_case = 1

" vimshell を開くマップ
nnoremap <Leader>vv :<C-U>VimShell<CR>
nnoremap <Leader>vc :<C-U>VimShellCreate<CR>

augroup VimShellMapping
    autocmd!
    " キーマッピングを戻す
    autocmd FileType vimshell nnoremap <buffer><c-j> <c-w>w
    autocmd FileType vimshell nnoremap <buffer><c-k> <c-w>W
    autocmd FileType vimshell nmap <buffer><c-c> <Plug>DWMClose
    autocmd FileType vimshell nmap <buffer><c-n> <Plug>DWMNew
    autocmd FileType vimshell nmap <buffer><m-c> <Plug>(vimshell_hangup)
    " 履歴補完はノーマルモードで
    autocmd FileType vimshell inoremap <buffer> <expr><silent> <C-l>  unite#sources#vimshell_history#start_complete(0)
    " iexe で mysql を実行したとき
    autocmd FileType int-mysql set filetype=mysql
    autocmd FileType int-mysql setlocal colorcolumn=
    autocmd FileType int-mysql nmap <buffer><c-c> <Plug>DWMClose
    autocmd FileType int-mysql imap <buffer><c-c> <Esc><Plug>DWMClose
    autocmd FileType int-mysql nmap <buffer><c-n> <Plug>DWMNew
    autocmd FileType int-mysql nmap <buffer><m-c> <Plug>(vimshell_hangup)
augroup END
