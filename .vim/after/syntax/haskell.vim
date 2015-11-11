
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

nnoremap <leader>l :call HaskellPragmas()<cr>

nnoremap <leader>D :call WritePragmas(b:usual_pragmas)<cr>

let b:usual_pragmas =
  \ [ 'DataKinds'
  \ , 'PolyKinds'
  \ , 'KindSignatures'
  \ , 'TypeOperators'
  \ , 'TypeFamilies'
  \ , 'GADTs'
  \ , 'FlexibleInstances'
  \ , 'FlexibleContexts'
  \ , 'UndecidableInstances'
  \ , 'LambdaCase'
  \ ]

fu! WritePragmas(Prags)
    for prag in reverse(a:Prags)
        call append(0, "{-# LANGUAGE " . prag . " #-}")
    endfor
endf

fu! HaskellPragmas()
    call inputsave()
    let l:prags = split(input("Pragma: ", "", "customlist,PragmaCompletion")," ")
    call WritePragmas(l:prags)
    call inputrestore()
endf

fu! PragmaCompletion(A,L,P)
    let l:lead = split(a:A," ")
    if len(l:lead) > 1
        let l:init = l:lead[:-2]
        let l:last = l:lead[-1]
    else
        let l:init = []
        let l:last = get(l:lead,0,"")
    endif
    let l:avail = readfile("/home/kylcarte/.vim/after/syntax/ghc-pragmas.txt")
    let l:compls = filter(l:avail,'v:val =~ "^' . l:last . '"')
    let l:prev = join(l:init," ")
    if len(l:prev) != 0
        let l:prev .= " "
    endif
    return map(l:compls,'"'.l:prev.'" . v:val')
endf

