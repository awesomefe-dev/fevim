# export FEVIM=$PETER/content/platform/awesomefe.dev/fevim

export FEVIM=$(PWD)
export MYKEY=$PETER/keys/peter_rsa

# export MYVIMRC=$FEVIM/init.vim

NVIM="XDG_CONFIG_HOME=$FEVIM /usr/local/Cellar/neovim/0.4.4/bin/nvim"

alias nv= $NVIM' -o'
alias nvh=$NVIM' -o'
alias nvv=$NVIM' -O'
alias nvt=$NVIM' -p'

# fnv
alias fnv=$NVIM" -u $FEVIM/nvim/fsmode.vim"
