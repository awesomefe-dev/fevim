" load elixir.vim
exec "so " . $FEVIM_CONF . '/elixir.vim'
exec "so " . $FEVIM_CONF . '/go.vim'

let g:ale_fixers = { 'elixir': ['mix_format'] }

" semantic code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" view documentation on the fly 
nnoremap <silent> K :call <SID>show_documentation()<CR>

" view an outline of current file 
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
