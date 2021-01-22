" Basic
set nu
set rtp+=$FEVIM

if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" Plugin

call plug#begin( stdpath('data') . '/plugged' )

Plug 'dracula/vim'

Plug 'scrooloose/nerdtree'

" End
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Config

" TODO: check whether theme has been installed
colorscheme dracula

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" 仅有 NERDTree 时关闭 neovim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" set encoding=UTF-8 " 字体/图标配置 no need in Neovim

