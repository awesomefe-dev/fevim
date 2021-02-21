# export FEVIM=$PETER/content/platform/awesomefe.dev/fevim

export FEVIM=$(PWD)

# export MYVIMRC=$FEVIM/init.vim
XDG_CONFIG_HOME="not_found_path"
export XDG_CONFIG_HOME_BAK=$XDG_CONFIG_HOME

NVIM="XDG_CONFIG_HOME=$FEVIM /usr/local/Cellar/neovim/0.4.4/bin/nvim"

alias nv= $NVIM' -o'
alias nvh=$NVIM' -o'
alias nvv=$NVIM' -O'
alias nvt=$NVIM' -p'

# fnv
