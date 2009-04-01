" GUI Options
set guifont=Inconsolata:h15
set guioptions-=T
set number
imap <C-l> <Space>=><Space>

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  colorscheme desertEx
  set lines=62
  set columns=200
else
  let g:CSApprox_loaded = 0
  colorscheme desert
endif
