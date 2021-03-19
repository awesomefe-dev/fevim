" ENV
let $PLAY=$HQ_VIM_HOME
let $PLAY_CONF=$PLAY . '/init.vim'

let $PLAY_RTP=$PLAY . '/runtime'
" !mkdir $PLAY_RTP
let $FULL_RTP=&rtp . ',' . $PLAY_RTP
set rtp=$FULL_RTP

let $PLAY_DR=$PLAY . '/dryrun.vim'

let $PLAY_SCRIPTS=$PLAY . "/scripts"

let $PLAY_DEPS=$PLAY . '/deps'
let $PLAY_DEPS_KM=$PLAY_DEPS . '/keymap.vim'
let $PLAY_DEPS_G=$PLAY_DEPS . '/general.vim'
let $PLAY_DEPS_UI=$PLAY_DEPS . '/ui.vim'
let $PLAY_DEPS_GUI=$PLAY_DEPS . '/gui.vim'
let $PLAY_DEPS_PLUG=$PLAY_DEPS . '/plugs.vim'
let $PLAY_DEPS_PC=$PLAY_DEPS . '/plugconf.vim'
let $PLAY_DEPS_FT=$PLAY_DEPS . '/ft.vim'
let $PLAY_DEPS_CT=$PLAY_DEPS . '/custom.vim'

let $PLAY_ASSETS=$PLAY . '/assets'
let $PLAY_BACKUP=$PLAY_ASSETS . '/backup'
let $PLAY_SWAP=$PLAY_ASSETS . '/swap'
let $PLAY_UNDO=$PLAY_ASSETS . '/undo'

let $CONF=$HOME . '/.vimrc'

" if exists('$VIM')
"   let $CONF=$VIM . '/_vimrc'
" else
"   let $CONF=$HOME . '/.vimrc'
" endif


" Plugins
exec "so " . $PLAY_DEPS_PLUG

" ===================================
" =   Basic Conf (without plugin)   =
" ===================================


" General
exec "so " . $PLAY_DEPS_G

" Encoding {{{
let $LANG='en_US.UTF-8'
if has("multi_byte")
  " UTF-8
  " under windows: original encoding cp936
  set encoding=utf-8
  set termencoding=utf-8
  set formatoptions+=mM
  " gbk2312,gb18030,cp936
  set langmenu=zh_CN
  set fileencodings=utf-8,gbk
  " / 是 escape token
  if v:lang =~? '^/(zh/)|/(ja/)|/(ko/)'
    set ambiwidth=double
  endif
  if has("win32")
    " redefine menu
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language message zh_CN.utf-8
  endif
else
  echoerr "Sorry, (G)vim was not compiled with +multi_byte option"
endif
" }}}

"" UI {{{
exec "so " . $PLAY_DEPS_UI

"" GUI
if has('gui_running')
  exec "so " . $PLAY_DEPS_GUI
endif


" Key mapping
exec "so " . $PLAY_DEPS_KM

"" File Type
exec "so " . $PLAY_DEPS_FT

" ===================================
" =         Plugin Conf             =
" ===================================
exec "so " . $PLAY_DEPS_PC

" ===================================
" =         Custom                  =
" ===================================
exec "so " . $PLAY_DEPS_CT

" Dry Run
exec "so " . $PLAY_DR
