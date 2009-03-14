" GUI Options
set guifont=Inconsolata:h12
set guioptions-=T

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  colorscheme railscasts 
  set lines=62
  set columns=237
else
  let g:CSApprox_loaded = 0
  colorscheme desert
endif
