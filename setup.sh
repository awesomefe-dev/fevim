# export FEVIM=$PETER/content/platform/awesomefe.dev/fevim

export FEVIM=$(PWD)

export MYKEY=$PETER/keys/peter_rsa

export FEVIMRC=$FEVIM/nvim/init.vim

NVIM="XDG_CONFIG_HOME=$FEVIM /usr/local/Cellar/neovim/0.4.4/bin/nvim"

# NVIM="/usr/local/Cellar/neovim/0.4.4/bin/nvim -u $FEVIMRC"


alias nv=$NVIM
alias nvh=$NVIM' -o'
alias nvv=$NVIM' -O'
alias nvt=$NVIM' -p'

alias rnv='/usr/local/Cellar/neovim/0.4.4/bin/nvim'

# fnv
alias fnv=$NVIM" -u $FEVIM/nvim/fsmode.vim"

# pure vim 
alias purev=$NVIM" -u NONE"
