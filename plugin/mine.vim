function! RunSpec(command)
  if a:command == ''
    let dir = 'spec'
  else
    let dir = a:command
  endif
  cexpr system("spec -r spec/vim_formatter.rb -f Spec::Runner::Formatter::VimFormatter " . dir)"a:command)
  cw
endfunction

command! -nargs=? -complete=file Spec call RunSpec(<q-args>)
map <leader>s :Spec<space>
