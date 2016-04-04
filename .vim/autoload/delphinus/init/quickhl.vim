function! delphinus#init#quickhl#hook_add() abort
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>t <Plug>(quickhl-manual-toggle)
  xmap <Space>t <Plug>(quickhl-manual-toggle)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  nmap <Space>j <Plug>(quickhl-cword-toggle)
  nmap <Space>] <Plug>(quickhl-tag-toggle)
  map  <Space>H <Plug>(operator-quickhl-manual-this-motion)
endfunction