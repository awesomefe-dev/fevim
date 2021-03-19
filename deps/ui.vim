set cursorline
set cursorcolumn
set hlsearch
set number

" new splitted window
set splitbelow
set splitright

" set nolist
set list
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set listchars=eol:¶,tab:>-,trail:~,extends:>,precedes:<

try
  colorscheme dracula 
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
  colorscheme desert
endtry

" color
if (has("termguicolors"))
 set termguicolors
endif

" Terminal
" 用 esc 键将 terminal 变为 normal mode
tnoremap <Esc> <C-\><C-n>
" tnoremap <c-b> <c-\><c-n>
" 在 insert mode 启动 terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" 用 ctrl+n 启动 terminal
function! OpenTerminal()
  let $VIMTERM=1
  let l:CUR_DIR=expand('%:p:h')
  " :h te
  :silent exec "split term://" . l:CUR_DIR . "//zsh"
  " !cd $CURRENT_DIR
  resize 10
  " scrolloff
  set so=0
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" Status
"
" default
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Similar, but add ASCII value of char under the cursor (like "ga") >
" set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
" Display byte count and byte value, modified flag in red. >
" set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
" hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

