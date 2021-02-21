" Basic
set nu
set rtp+=$FEVIM
set ignorecase
set wildignorecase
set smartcase " override by /target\c \C

set listchars=space:.

set so=7


" misc
noremap <Leader>nh :nohl<CR>
noremap <Leader>q :q<CR>
noremap <Leader>x :wq<CR>
noremap <Leader>tp :tab sb 2<CR>

" indent  
set sw=2   " shiftwidth
set ts=2   " tabstop
set sts=2  " softtabstop
set et     " expandtabs expand tabs to spaces

" buffers 
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" copy/paste

" color
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

set splitright
set splitbelow

" Config Management
" function! ConfAction(action)
"   let $CUR_CONF=$FEVIM . "/init.vim"
"   echo $CUR_CONF
"   if a:action == "edit"
"     e $CUR_CONF
"   endif 
"   if a:action == "reload"
"     so $CUR_CONF
"   endif 
" endfunction
" edit
" save in env var
let $CUR_CONF=$FEVIM . "/init.vim"
" nnoremap <Leader>ve :call ConfAction("edit")<CR>
nnoremap <Leader>ec :e $CUR_CONF<CR>
" nnoremap confe :e $CUR_CONF<CR> " ESC_confe
" reload
" nnoremap <Leader>vr :call ConfAction("reload")<CR>
"" lc load_config
nnoremap <Leader>lc :so $CUR_CONF<CR>
" nnoremap confr :source $CUR_CONF<CR>

" Terminal
" 用 esc 键将 terminal 变为 normal mode
tnoremap <Esc> <C-\><C-n>
" 在 insert mode 启动 terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" 用 ctrl+n 启动 terminal
function! OpenTerminal()
  let $CURRENT_DIR=expand('%:p:h')
  " :h te
  split term://$CURRENT_DIR//zsh
  " !cd $CURRENT_DIR
  resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" Help
noremap <Leader>h :h 
" nnoremap <Leader>h :h

" Save
"" Works in normal mode, must press Esc first"
map <A-s> :w<CR>
map <A-w> :w<CR>
map <A-r> :w<CR>\lc
map <A-q> <CR>:q<CR>

"" Works in insert mode, saves and puts back in insert mode"
"" i 后边不能有任何字符，否则会插入文件中
"" i 之前先后退一下光标
imap <A-s> <Esc>:w<CR>li
imap <A-w> <Esc>:w<CR>l
"" save and load config
imap <A-r> <Esc>:w<CR>l\lc
imap <A-x> <Esc>:x<CR>
imap <A-q> <Esc>:q<CR>
" map <A-s> :w<kEnter>  "Works in normal mode, must press Esc first"
" imap <A-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
"" work in MacVim
" map <D-s> :w<CR>  "Works in normal mode, must press Esc first"
" imap <D-s> <Esc>:w<CR>i "Works in insert mode, saves and puts back in insert mode"


" panels 切换键
"" terminal mode
tnoremap <A-h> <C-\><C-n><C-w>h 
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" FileType
au! BufNewFile,BufRead *.svelte set ft=html

" Plugin

call plug#begin( stdpath('data') . '/plugged' )

Plug 'dracula/vim'

Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.nvimfzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TypeScript and TSX support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Git
Plug 'tpope/vim-fugitive'

"
Plug 'editorconfig/editorconfig-vim'

" End
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Config

" TODO: check whether theme has been installed
colorscheme dracula

" # NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" 仅有 NERDTree 时关闭 neovim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" set encoding=UTF-8 " 字体/图标配置 no need in Neovim

" # fugitive 
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gl :Gpull<CR>

" # fzf
nnoremap <C-p> :FZF<CR>
" 设置目标文件打开位置 (新 tab，below，vertical, 当前 tab: enter)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" 配置 fzf 使用 silversearcher-ag 来搜索，可以识别 .gitignore 中文件如 node_modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" # coc.vim
let g:coc_config_home = $FEVIM . '/config'
let g:coc_global_extensions = [
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver'
  \]

command! -nargs=+ Say :echo "<args>"

" use private key
function! UseDKFn()
  echo 'use default key'
endfunction

function! UsePKFn() " (name)
  echo 'use default key'
  echom a:name
endfunction

" DefaultKey
command! -nargs=0 Dkloadssh :call UseDKFn()
" PeterLau
command! -nargs=0 Plloadssh :call UsePKFn('peter')

" CustomFn CFn_RunFile
function! RunFile()
  let l:filename=expand("%:t")
  let l:filedir=expand("%:p:h")
  let l:filetype=&ft
  " set autochdir
  cd %:p:h
  !./%
endfunction

function! RunProj()
endfunction
