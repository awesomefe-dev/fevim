" Full Screen Dev Mode

" import basic config 
so './init.vim'

" full screen window

" NERTree 
NERDTreeToggle<CR>
" Terminal (for every tab)
autocmd VimEnter * ++nested split term://sh
