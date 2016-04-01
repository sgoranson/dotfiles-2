scriptencoding utf-8

function! delphinus#vimfiler#init() abort
  " :edit で vimfiler を起動
  let g:vimfiler_as_default_explorer = 1
  " セーフモード OFF で起動
  let g:vimfiler_safe_mode_by_default = 0
  " devicons 設定
  call vimfiler#custom#profile('default', 'context', {'columns': 'type:devicons:size:time'})
endfunction
