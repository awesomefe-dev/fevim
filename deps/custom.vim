
" Misc 

command! -nargs=+ Say :echo "<args>"

" use default key
function! UseDKFn()
  echo 'use default key'
  let $GIT_SSH_COMMAND="ssh"
endfunction

" use private key
function! UsePKFn() " (name)
  " echom a:name
  echo 'use custom key'
  let $GIT_SSH_COMMAND="ssh -i " . $MYKEY
endfunction

" DefaultKey
command! -nargs=0 Dkloadssh :call UseDKFn()
" PeterLau
command! -nargs=0 Pkloadssh :call UsePKFn()

" CustomFn CFn_RunFile
" Rust exec for lots of languages
" 依赖输入的情况
function! RunSh()
  :silent exec "!sh " . "./" . expand("%:t")
endfunction

function! RunExec()
  " !./%
  :silent exec "!./" . expand("%:t")
endfunction

function! RunFile()
  let l:filename=expand("%:t")
  let l:filedir=expand("%:p:h")
  let l:filetype=&ft
  " set autochdir
  cd %:p:h
  if l:filetype == "sh"
    :call RunSh()
  else
    :call RunExec()
  endif
endfunction

function! RunProj()
endfunction

map <silent> <Leader><Leader>r :call RunFile()<CR>

function! FullScreen()
  let l:cmd='!cd ' . $PLAY_SCRIPTS . ' && ./gofs.applescript'
  echo l:cmd 
  :silent exec l:cmd
endfunction

" 玄学问题? 偶尔 A-f 下移光标
" map <A-f> :call FullScreen()<CR>
map <Leader><Leader>f :call FullScreen()<CR>

" https://stackoverflow.com/questions/7069927/in-vimscript-how-to-test-if-a-window-is-the-last-window
function! CloseOrQuit()
  " if this window is last on screen quit, if not close
  if winbufnr(2) == -1
    quit!
  else
    close
  endif
endfunction

augroup terminal
  autocmd!
  " autocmd TermClose * if getline('$') == 'Exit 0' | close | endif 
  " autocmd TermClose * echom "GetLine" . getline('$') . "END"
  " au TermClose * close
  au TermClose * call CloseOrQuit()
augroup end

" Bind outside program

noremap <Leader><Leader>m :silent exec "!" . $PLAY_SCRIPTS . "/playfb2k.applescript"<CR>

" browsh: browser in terminal
noremap <Leader><Leader>b :vs term://browsh
let t:BROWSH_CONF=$HOME . '/Library/Application Support/browsh/config.toml'
noremap <Leader><Leader>eb :sp t:BROWSH_CONF<CR>

" templates (custom) use vime-template
" if has("autocmd")
"   let templates_dir=$VIM_HOME . "templates"
"   silent echo templates_dir
"   aug templates
"     au BufNewFile *.sh 0r templates_dir/skeleton.sh
"   aug END
" endif

" Dev

" let $DEV_CONF=$PLAY_DEPS . '/dev.vim'
" exec "source " . $DEV_CONF

" ## Django
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" autocmd FileType asm colorscheme default
" au * * colorscheme dracula
" au * asm colorscheme default
" toggle colorscheme
function! ToggleCS()
  if g:colors_name == "default"
    colorscheme dracula
  else
    colorscheme default
  endif
endfunction

noremap <Leader><Leader>c :call ToggleCS()<CR>
