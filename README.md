Clean
FrontEnd

## 插件管理 
  vim-plug (https://github.com/junegunn/vim-plug)

call plug#begin("~/.vim/plugged")
  " Plugin Section
call plug#end()

## 主题 

  dracula

## File Explorer 文件管理

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
  https://github.com/ryanoasis/vim-devicons#installation
  必须作为最后一项载入
  安装字体
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font

开关快捷键 Ctrl+b

## Integrated Terminal 集成终端

启动终端 Ctrl+b
回到编辑区域 Ctrl+w w

添加区域切换快捷键 (iTerm2 中设置 LeftOption 为 +ESC)

## File Searching 文件查找

fuzzy finder

- use silversearcher-ag

https://github.com/ggreer/the_silver_searcher

brew install the_silver_searcher

## IntelliSense and Syntax Highlighting 代码提示和语法高亮

coc.nvim

TypeScript and TSX support

## TODO: 

多主题管理

React / Vue / Svelte 

References:

https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd

https://dev.to/vshl/my-neovim-setup-31n3

https://blog.csdn.net/yihuajack/article/details/108675062

https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/

https://hackernoon.com/how-to-use-vim-for-frontend-development-2020-edition-dac83yyh

https://dev.to/fidelve/using-vim-as-your-main-editor-for-web-development-5a73

https://dev.to/ritikadas/using-neovim-as-an-effortless-way-to-edit-code-installation-and-setup-guide-for-windows-10-5dhc

https://www.hiteshpaul.com/posts/1378/ Configuring (Neo)vim: A modular approach - Terminal Witchcraft

Links:

https://spacevim.org/

https://www.fullstacklibrary.com/p/vim-for-front-end-web-developers

https://github.com/victorvoid/vim-frontend victorvoid/vim-frontend: Vim Frontend is a Vim configured for Front-end Developers.





