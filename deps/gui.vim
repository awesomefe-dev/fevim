" size of Window
set lines=35 columns=80
" hide menu etc.
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" apply native tab style (not gui tab style)
set guioptions-=e

" set guifont=Inconsolata:h12:cANSI
if has('win16') || has('win32') || has('win95') || has('win64')
" font config style under windows
set guifont=Consolas:h11,Courier_New:h11:cANSI
set guifontwide=幼圆:b:h11:cGB2312
else
" font config style under macOS
set guifont=Monaco:h11
" font config style under Linux 
" set guifont=MiscFixed\ Semi-Condensed\ 10
endif
