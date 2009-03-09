set nocompatible

" General Vim behaviour.
set nowrap 
set autoindent expandtab smarttab           "settings for indentation
set nobackup nowritebackup                  "turn off backup file creation
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P
set laststatus=2                            "always show the status line

" GUI Options
set guifont=Inconsolata:h12
set guioptions-=T

syntax on                                   "syntax highlighting
