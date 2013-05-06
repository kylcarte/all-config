set foldmethod=marker
set nocompatible
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler                        
set nohls
set incsearch
set virtualedit=block
set whichwrap=b,s,h,l
set bg=dark
set scrolloff=10
set showcmd
setl lispwords+=pmatch,syntax-rules,syntax-case,let-values,match
filetype plugin indent on
syntax enable
hi Special  	term=bold		ctermfg=Red	guifg=Red
hi Delimiter	term=bold		ctermfg=Red	guifg=Red

let mapleader=","

nmap sap vapk:!sort<cr>

nmap <C-e> :let @a=''<cr>:g/::/y A<cr>gg}"aPjvap:s/ .*//g<cr>

" au FileType html,php setl ts=2 sw=2

au FileType scheme syn keyword schemeSyntax ->

" ParentheC keywords
setl lispwords+=define-label,define-union,union-case,define-registers,define-program-counter,matche
au FileType scheme syn keyword schemeSyntax define-label define-union union-case define-registers define-program-counter
au FileType scheme syn keyword schemeFunc mount-trampoline dismount-trampoline

" miniKanren keywords
setl lispwords+=run,run*,exist,conde
au FileType scheme syn keyword schemeSyntax run run* exist conde conda ifa condu ifu
au FileType scheme syn keyword schemeFunc == =/= take

" Disable Autocomment
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use \t in Makefiles
au FileType make set noexpandtab

" Custom key mappings 
nmap TM :ConqueTermVSplit bash<cr> 
nmap HL :set hls! <cr>
"nmap NU :set nu!<cr>
nmap RR mz=ap`z
"   move around in splits 
noremap <C-w> <C-w>w
" Move up and down on wrapped lines
nmap j gj
nmap k gk
" Yank to end of line
nmap Y y$
nmap K xi<cr><esc>mz=ap`z
" Unnest block
nmap U :call Unnest()<cr>
" Transpose adjacent S-expressions
nmap T :call TransposeSExps()<cr>
nmap _ :call ClearRegister()<cr>

fu! ClearRegister()
    let char = getchar()
    normal "q" . char . "q"
endf

fu! OCMatch()
    mark a
    let n = line(".")
    let mine = getline(line("."))
    wincmd w
    let theirs = getline(line("."))
    wincmd w
    let res = system("/home/kylcarte/haskell/scripts/match-all \"".mine."\" \"".theirs."\"")
    execute res
    execute "'a"
endf

"nmap n ]c
"nmap N [c
"nmap s J
"nmap m :call OCMatch()<cr>
