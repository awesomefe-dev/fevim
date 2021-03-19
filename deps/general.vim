set nocompatible
" set nobackup
" set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim share default clipboard with system
set clipboard+=unnamed
" do't map alt key to menu
set winaltkeys=no
set backupdir=$PLAY_BACKUP
set directory=$PLAY_SWAP
set undodir=$PLAY_UNDO

set hidden
set ignorecase
set wildignorecase " command mode case insensitive
set smartcase " override by /target\c \C

" set foldmethod=syntax
" set nofoldenable
set foldlevelstart=99
