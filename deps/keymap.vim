let $PLAY_PLUGS=$PLAY . '/plugs'

let $SNIPPET=$PLAY_PLUGS . '/vim-snippets/snippets/_.snippets'
let $TEMPLATE=$PLAY_PLUGS . '/vim-template/templates/=template=.c'

nnoremap q <nop>
" TODO: try :q then :wq
nnoremap <leader>q :q<cr>
nnoremap qqq q

noremap <leader>h :tab help 

nnoremap <leader>w :w<cr>
inoremap <leader>w <esc>:w<cr>
nmap <c-s> :w!<cr>i
vmap <c-s> <c-c>:w!<cr>
imap <c-s> <esc>:w!<cr>

nnoremap <leader>x :wq<cr>

" nnoremap <leader>lc :exec "w"<cr> <bar> "so " . $PLAY_CONF<cr>
nnoremap <leader>lc :exec "so " . $PLAY_CONF<cr>
" wrong way:
" nnoremap <leader>lc :so $PLAY_CONF<cr>

nmap <leader>ec :tabe $PLAY_CONF<cr>
nmap <leader>sc :source $VIM/_vimrc<cr>

" tabs
" map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader><leader>a :tabp<cr>
map <leader><leader>s :tabn<cr>
" 与 help 文档跳转热键冲突
" nmap <c-]> :tabn<cr>
" imap <c-]> <esc>:tabn<cr>

" open file in tab 
" noremap <c-t> :tabe 
map <leader><leader>t :tabedit 

" buffers 
nnoremap <c-j> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <Leader>l :ls<CR>:b<Space>


" 移动分割窗口
" nmap <C-j> <C-W>j
" nmap <C-k> <C-W>k
" nmap <C-h> <C-W>h
" nmap <C-l> <C-W>l

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>

" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" IDE like delete
inoremap <C-BS> <Esc>bdei

nnoremap vv ^vg_
" 转换当前行为大写
inoremap <C-u> <esc>mzgUiw`za
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>

nnoremap <F2> :setlocal number!<cr>
" nnoremap <leader>w :set wrap!<cr>

imap <C-v> "+gP
" vmap <C-c> "+y
vnoremap <BS> d
" vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
imap <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" 打开当前目录 windows
map <leader>ex :!start explorer %:p:h<CR>

" 打开当前目录CMD
map <leader>cmd :!start<cr>
" 打印当前时间
map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" 复制当前文件/路径到剪贴板
nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

" 设置切换Buffer快捷键
"   macOS 与 Misson Control 切换 Wordspace 冲突
" nnoremap <C-left> :bn<CR>
" nnoremap <C-right> :bp<CR>

" 与 buffer 切换的映射 冲突 暂时注释
" nnoremap <silent><c-j> :update<cr>
vnoremap <silent><c-j> <c-c>:update<cr>gv
inoremap <silent><c-j> <c-c>:update<cr>

" Edit Snippet
nnoremap <leader>es :tabe $SNIPPET<CR>

" Edit Template
nnoremap <leader>et :tabe $TEMPLATE<CR>

" noremap <Leader>nh :nohl<CR>
" fn+f9
noremap <f9> :nohl<CR>

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

" # vim-plug
noremap <Leader>ii :PlugInstall<CR>
