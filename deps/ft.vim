filetype indent plugin on

autocmd FileType * setl sw=2 sts=2 ts=2 et

" autocmd FileType asm setl sw=4 sts=4 ts=4 et

" Svelte
au! BufNewFile,BufRead *.svelte set ft=html

" augroup ft_vim
"   " 打开配置文件的时候 vim 就会折叠部分片段
"   au!
"   au FileType vim setlocal foldmethod=marker
" augroup END
