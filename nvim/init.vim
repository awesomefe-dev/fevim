" TOC 
"   ENV
"   Plugin 
"   Basic 
"   PluginConfig
"   Misc

" ENV 

let $XDG_CONFIG_HOME=$XDG_CONFIG_HOME_BAK
let $VIMTERM=1

let $FEVIM_HOME=$FEVIM . '/nvim'
let $FEVIM_INIT=$FEVIM_HOME . '/init.vim'
let $FEVIM_CONF=$FEVIM_HOME . '/conf'
let $FEVIM_DATA=$FEVIM_HOME . '/data'
let $FEVIM_SCRIPTS=$FEVIM_HOME . '/scripts'
let $FEVIM_PLUG=$FEVIM_DATA . '/plugged'



" Plugin

" :h stdpath('data')
" call plug#begin( stdpath('data') . '/plugged' )

let $FEVIM_PLUG_CONF=$FEVIM_HOME . '/plug.vim'
exec "source " . $FEVIM_PLUG_CONF
nnoremap <Leader>ep :e $FEVIM_PLUG_CONF<CR>



" Basic

set hidden
set nu
set rtp+=$FEVIM
set ignorecase
set wildignorecase " command mode case insensitive
set smartcase " override by /target\c \C

set listchars=space:.

set so=7

set autochdir

let s:STATUS_CONF=$FEVIM_CONF . '/status.vim'
exec "source " . s:STATUS_CONF

" noremap <silent> <Leader><Leader>p :echo expand('%:p')<CR>
" noremap <Leader><Leader>p :echo expand('%:p')<CR><CR>

" For All filetypes
autocmd FileType * setl sw=2 sts=2 ts=2 et
" autocmd FileType asm setl sw=4 sts=4 ts=4 et

" Svelte
au! BufNewFile,BufRead *.svelte set ft=html

" set foldmethod=syntax
" set nofoldenable
set foldlevelstart=99

" 与 buffer 切换的映射 冲突 暂时注释
" nnoremap <silent><c-j> :update<cr>
vnoremap <silent><c-j> <c-c>:update<cr>gv
inoremap <silent><c-j> <c-c>:update<cr>


" Plugin Config

colorscheme dracula

" # vim template
let g:email="superpeterlau@outlook.com"
let g:username="Peter Lau"

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

" use <cr> select and format code
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use <tab> to nav
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:python3_host_prog = $HOME . '/.asdf/shims/python3'

" # deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1

" call deoplete#custom#source('')

" Languages
"   Go 

let g:go_template_autocreate = 0



" Misc

" mapping

" openfile in tab 
noremap <c-t> :tabe 

" noremap <Leader>nh :nohl<CR>
" fn+f9
noremap <f9> :nohl<CR>
noremap <Leader>q :wq<CR>
" noremap <Leader>x :wq<CR>

" remap recording q
nnoremap <Leader><Leader>q q
nnoremap q :q<CR>
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

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

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
" 依赖输入的情况
function! RunSh()
  :silent exec "!sh " . "./" . expand("%:t")
endfunction

function! RunExec()
  " !./%
  :silent exec "!./" . expand("%:t")
endfunction

function! RunFile()
  let l:filename=expand("%:t")
  let l:filedir=expand("%:p:h")
  let l:filetype=&ft
  " set autochdir
  cd %:p:h
  if l:filetype == "sh"
    :call RunSh()
  else
    :call RunExec()
  endif
endfunction

function! RunProj()
endfunction

map <silent> <Leader><Leader>r :call RunFile()<CR>

function! FullScreen()
  let l:scripts_home=$FEVIM_HOME . "scripts/"
  " echo l:scripts_home 
  " echo l:scripts_home . 'gofs.applescript'
  let l:cmd='!cd ' . l:scripts_home . ' && ./gofs.applescript'
  " echo l:cmd 
  :silent exec l:cmd
endfunction

" 玄学问题? 偶尔 A-f 下移光标
" map <A-f> :call FullScreen()<CR>
map <Leader><Leader>f :call FullScreen()<CR>

" https://stackoverflow.com/questions/7069927/in-vimscript-how-to-test-if-a-window-is-the-last-window
function! CloseOrQuit()
  " if this window is last on screen quit, if not close
  if winbufnr(2) == -1
    quit!
  else
    close
  endif
endfunction

augroup terminal
  autocmd!
  " autocmd TermClose * if getline('$') == 'Exit 0' | close | endif 
  " autocmd TermClose * echom "GetLine" . getline('$') . "END"
  " au TermClose * close
  au TermClose * :call CloseOrQuit()<CR>
augroup end

" Bind outside program

noremap <Leader><Leader>m :silent exec "!" . $FEVIM_SCRIPTS . "/playfb2k.applescript"<CR>
noremap <Leader><Leader>b :vs term://browsh
let t:BROWSH_CONF=$HOME . '/Library/Application Support/browsh/config.toml'
noremap <Leader><Leader>eb :sp t:BROWSH_CONF<CR>

" templates (custom) use vime-template
" if has("autocmd")
"   let templates_dir=$FEVIM_HOME . "templates"
"   silent echo templates_dir
"   aug templates
"     au BufNewFile *.sh 0r templates_dir/skeleton.sh
"   aug END
" endif

" Dev

let s:DEV_CONF=$FEVIM . '/nvim/dev.vim'
exec "source " . s:DEV_CONF

" ## Django
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" autocmd FileType asm colorscheme default
" au * * colorscheme dracula
" au * asm colorscheme default
" toggle colorscheme
function! ToggleCS()
  if g:colors_name == "default"
    colorscheme dracula
  else
    colorscheme default
  endif
endfunction

noremap <Leader><Leader>c :call ToggleCS()<CR>
