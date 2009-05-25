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
set history=1000                            " remember the last 1000 command instead of the default 20
set cursorline                              " highlight the current line
filetype plugin indent on                   " Enable filetype-specific indenting and plugins

syntax on                                   " syntax highlighting

let g:clj_want_gorilla = 1

" Leader mappings
let mapleader = ","                         " The leader character is like a vim modifier key
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let vimclojure#NailgunClient = "/Users/christian/.vim/ng"

set wildmenu                                " Make the command/file menu completion show more information
set wildmode=list:longest                   " Make the completions window larger

" Fuzzy Finder Settings
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map <leader>f :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>r :ruby finder.rescan!<CR>:FuzzyFinderRemoveCache<CR>

map <leader>a :Ack<SPACE>
map <leader>n :NERDTreeToggle<CR>
map <leader>x :BD<CR>
map <leader>X :BD!<CR>
map <S-Enter> O<Esc>j
map <CR> O<Esc>

" Specky Settings
let g:speckyBannerKey = "<C-S>b"
let g:speckyQuoteSwitcherKey = "<C-S>'"
let g:speckyRunRdocKey = "<C-S>r"
let g:speckySpecSwitcherKey = "<C-S>x"
let g:speckyRunSpecKey = "<C-S>s"
let g:speckyRunSpecCmd = "spec -f "
let g:speckyRunRdocCmd = "fri -L -f plain"
let g:speckyWindowType = 2

" Rspec
function! RunRspec()
ruby << EOF
  buffer = VIM::Buffer.current
  spec_file = VIM::Buffer.current.name
  command = "ruby ~/.vim/bin/run_rspec.rb #{spec_file}"
  print "Running Rspec for #{spec_file}. Results will be displayed in Firefox."
  system(command)
EOF
endfunction
map <leader>s :call RunRspec()<CR>
"map <leader>s :RunSpec<CR>
"map <leader>S :RunSpecs<CR>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" binds \ T to taglist (sorta like textmate apple-shift-t)
let Tlist_Show_Menu = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Horiz_Window = 1  

map <leader>m :TlistToggle<CR>

