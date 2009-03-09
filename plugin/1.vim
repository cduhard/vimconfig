set nocompatible

" General Vim behaviour.
set nowrap 
set autoindent expandtab smarttab "setting for indentation
set nobackup nowritebackup "turn off backup file creation

" GUI Options
set guifont=Inconsolata:h12
set guioptions-=T
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P

syntax on "syntax highlighting
