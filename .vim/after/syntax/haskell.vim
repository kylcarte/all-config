
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

nnoremap <leader>q iimport qualified 

nnoremap <leader>l :call HaskellPragma()<cr>

fu! HaskellPragma()
    call inputsave()
    let l:prag = input("Pragma: ", "", "customlist,PragmaCompletion")
    call append(0, "{-# LANGUAGE " . l:prag . " #-}")
    call inputrestore()
endf

fu! PragmaCompletion(A,L,P)
    let l:prgs = readfile("/home/kylcarte/.vim/after/syntax/ghc-pragmas.txt")
    return filter(l:prgs,'v:val =~ "^'.a:A.'"')
endf

