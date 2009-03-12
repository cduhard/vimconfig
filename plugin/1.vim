set nocompatible

" General Vim behaviour.
set nowrap 
set autoindent expandtab smarttab           " settings for indentation
set tabstop=2 shiftwidth=2 softtabstop=2    " use 2 spaces for indenting
set nobackup nowritebackup                  " turn off backup file creation
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P
set laststatus=2                            " always show the status line
set incsearch ignorecase smartcase hlsearch " search options
set hidden
filetype plugin indent on                   " Enable filetype-specific indenting and plugins

syntax on                                   " syntax highlighting

" Leader mappings
let mapleader = ","                         " The leader character is like a vim modifier key
map <leader>t :FuzzyFinderTextMate<CR>      " Start up the fuzzyfindertextmate by typing: ,t
