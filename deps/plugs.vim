let $PLAY_PLUGS=$PLAY . '/plugs'

" Initialize plugin system
call plug#begin($PLAY_PLUGS)

Plug 'dracula/vim'

Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.nvimfzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Highlight
" https://github.com/sheerun/vim-polyglot sheerun/vim-polyglot: A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Autu-pair
Plug 'jiangmiao/auto-pairs'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" snippets :CocInstall coc-snippets
Plug 'honza/vim-snippets'

" TypeScript and TSX support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Git
Plug 'tpope/vim-fugitive'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Linting
" Plug 'dense-analysis/ale'

" Project level Find && Replace
" Plug 'stefandtw/quickfix-reflector.vim'

" Project File Switch
" Plug 'tpope/vim-projectionist'

" Test
Plug 'vim-test/vim-test'

"" this part is optional, but I prefer using neoterm as the vim-test runner
Plug 'kassio/neoterm'

" Templates
"   Edit templates: data/plugged/vim-template/templates/
Plug 'aperezdc/vim-template'

" Comment
Plug 'tpope/vim-commentary'


"" Elixir
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" :CocInstall coc-elixir
" Plug 'elixir-editors/vim-elixir'

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
