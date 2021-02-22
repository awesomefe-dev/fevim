" TOC 
"   Plugin 
"   Basic 
"   PluginConfig
"   Misc

" Plugin

" :h stdpath('data')
" call plug#begin( stdpath('data') . '/plugged' )
call plug#begin($FEVIM . '/nvim/data/plugged')

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

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Linting
Plug 'dense-analysis/ale'

" Project level Find && Replace
" Plug 'stefandtw/quickfix-reflector.vim'

" Project File Switch
" Plug 'tpope/vim-projectionist'

" Test
Plug 'vim-test/vim-test'

"" this part is optional, but I prefer using neoterm as the vim-test runner
Plug 'kassio/neoterm'
let test#strategy = "neoterm"

" Templates
Plug 'aperezdc/vim-template'

" Comment
Plug 'tpope/vim-commentary'

" TODO: loop thought append list
" TODO: autoload ./plug/ ./config/
" so '$FEVIM/nvim/plug/elixir.vim'

"" Elixir
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'

"" Go
Plug 'fatih/vim-go'
" GoInstallBinaries

"" Rust
" :CocInstall coc-rust-analyzer
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"" Java
"Plug ‘fatih/vim-go’

"" Python
"Plug ‘fatih/vim-go’

" End
Plug 'ryanoasis/vim-devicons'

call plug#end()
" Basic
set nu
set rtp+=$FEVIM
set ignorecase
set wildignorecase " command mode case insensitive
set smartcase " override by /target\c \C

set listchars=space:.

set so=7

set autochdir

" TODO: use status line
" noremap <silent> <Leader><Leader>p :echo expand('%:p')<CR>
" noremap <Leader><Leader>p :echo expand('%:p')<CR><CR>

autocmd FileType * setl sw=2 sts=2 ts=2 et

" Svelte
au! BufNewFile,BufRead *.svelte set ft=html


" set foldmethod=syntax
" set nofoldenable
set foldlevelstart=99

" 与 buffer 切换的映射冲突
" nnoremap <silent><c-j> :update<cr>
vnoremap <silent><c-j> <c-c>:update<cr>gv
inoremap <silent><c-j> <c-c>:update<cr>

" remap q
nnoremap <Leader>q q
nnoremap q :q<CR>


let $XDG_CONFIG_HOME=$XDG_CONFIG_HOME_BAK
let s:NVIM_HOME=$FEVIM . "/nvim/"

" misc
" noremap <Leader>nh :nohl<CR>
" fn+f9
noremap <f9> :nohl<CR>
noremap <Leader>q :q<CR>
noremap <Leader>x :wq<CR>
" noremap <Leader>tp :tab sb 2<CR>
" vert belowright sb 2
" sb 2

" indent  
set sw=2   " shiftwidth
set ts=2   " tabstop
set sts=2  " softtabstop
set et     " expandtabs expand tabs to spaces

" buffers 
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <Leader>l :ls<CR>:b<Space>

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
let $CUR_CONF=$FEVIM . "/nvim/init.vim"
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
" tnoremap <c-b> <c-\><c-n>
" 在 insert mode 启动 terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" 用 ctrl+n 启动 terminal
function! OpenTerminal()
  let $CURRENT_DIR=expand('%:p:h')
  " :h te
  split term://$CURRENT_DIR//zsh:alias e=exit
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
" map <A-w> :w<CR>
map <A-r> :w<CR>\lc
map <A-x> :x<CR>
map <A-q> <CR>:q<CR>

"" Works in insert mode, saves and puts back in insert mode"
"" i 后边不能有任何字符，否则会插入文件中
"" i 之前先后退一下光标
imap <A-s> <Esc>:w<CR>l
imap <A-w> <Esc>:w<CR>li
"" save and load config
imap <A-r> <Esc>:w<CR>l\lc
imap <A-x> <Esc>:x<CR>
" imap <A-q> <Esc>:wq<CR>
" map <A-s> :w<kEnter>  "Works in normal mode, must press Esc first"
" imap <A-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
"" work in MacVim
" map <D-s> :w<CR>  "Works in normal mode, must press Esc first"
" imap <D-s> <Esc>:w<CR>i "Works in insert mode, saves and puts back in insert mode"


" panels 切换键
"" terminal mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" FileType
au! BufNewFile,BufRead *.svelte set ft=html


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
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>b :NERDTreeToggle<CR>
" set encoding=UTF-8 " 字体/图标配置 no need in Neovim

" # fugitive 
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gp :Gpush<CR>
noremap <Leader>gu :Gpush -u origin HEAD<CR>
noremap <Leader>gl :Gpull<CR>

" # vim-plug
noremap <Leader>ii :PlugInstall<CR>

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
let g:coc_config_home = $FEVIM . '/nvim/config'
let g:coc_data_home = $FEVIM
let g:coc_global_extensions = [
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver'
  \]


" Dev
let s:dev_conf=$FEVIM . '/nvim/dev.vim'
exec "source " . s:dev_conf

" ## Django
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
" Misc 


command! -nargs=+ Say :echo "<args>"

" use default key
function! UseDKFn()
  echo 'use default key'
  let $GIT_SSH_COMMAND="ssh"
endfunction

" use private key
function! UsePKFn() " (name)
  " echom a:name
  echo 'use custom key'
  let $GIT_SSH_COMMAND="ssh -i " . $MYKEY
endfunction

" DefaultKey
command! -nargs=0 Dkloadssh :call UseDKFn()
" PeterLau
command! -nargs=0 Pkloadssh :call UsePKFn()

" CustomFn CFn_RunFile
" Rust exec for lots of languages
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

function! FullScreen()
  let l:scripts_home=s:NVIM_HOME . "scripts/"
  " echo l:scripts_home 
  " echo l:scripts_home . 'gofs.applescript'
  let l:cmd='!cd ' . l:scripts_home . ' && ./gofs.applescript'
  " echo l:cmd 
  :silent exec l:cmd
endfunction

" 玄学问题? 偶尔 A-f 下移光标
" map <A-f> :call FullScreen()<CR>
map <Leader><Leader>f :call FullScreen()<CR>

augroup terminal
  autocmd!
  " autocmd TermClose * if getline('$') == 'Exit 0' | close | endif 
  " autocmd TermClose * echom "GetLine" . getline('$') . "END"
  au TermClose * close
augroup end

" templates (custom) use vime-template
" if has("autocmd")
"   let templates_dir=s:NVIM_HOME . "templates"
"   silent echo templates_dir
"   aug templates
"     au BufNewFile *.sh 0r templates_dir/skeleton.sh
"   aug END
" endif

" TODO: echo extensions >> .gitignore

" TODO: 处理中英文切换
" autocmd insertFile
" insert (en-mode)
" count shift pressed count 
" autocmd leave insert
" should call press shift
