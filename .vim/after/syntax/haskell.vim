
" insert LANGUAGE pragma
nnoremap <leader>l i{-# LANGUAGE  #-}<esc>3hi

" copy function name from type sig onto next line
nnoremap <leader>f ^yawo<esc>PA

" comment out a paragraph
nnoremap <leader>c {o{-<esc>}O-}<esc>
" uncomment a paragraph
nnoremap <leader>C {jdd}kdd

" import statement
nnoremap <leader>i iimport 

