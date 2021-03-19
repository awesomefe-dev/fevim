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
"   VIM_HOME
"     /coc
"     /coc-settings.json
let $NVIM_COC_HOME = $PLAY . '/coc'
let g:coc_config_home = $PLAY
let g:coc_data_home = $NVIM_COC_HOME
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
"   https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

let g:go_template_autocreate = 0

