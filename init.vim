" Basic
set nu
set rtp+=$FEVIM

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
nnoremap <Leader>ve :e $CUR_CONF<CR>
" nnoremap confe :e $CUR_CONF<CR> " ESC_confe
" reload
" nnoremap <Leader>vr :call ConfAction("reload")<CR>
nnoremap <Leader>vr :so $CUR_CONF<CR>
" nnoremap confr :source $CUR_CONF<CR>

" Terminal
" 用 esc 键将 terminal 变为 normal mode
tnoremap <Esc> <C-\><C-n>
" 在 insert mode 启动 terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" 用 ctrl+n 启动 terminal
function! OpenTerminal()
  let $CURRENT_DIR=expand('%:p:h')
  split term://zsh !cd $CURRENT_DIR
  resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" panels 切换键
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
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" set encoding=UTF-8 " 字体/图标配置 no need in Neovim

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
