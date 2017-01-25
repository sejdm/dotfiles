"inoremap jk <esc>
set go-=m  "remove menu bar
set mouse=a
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L
set t_Co=256
set smartcase
set autochdir
set hidden

call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'

"Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jeetsukumaran/vim-filebeagle'
Plug 'vim-airline/vim-airline'
Plug 'gerw/vim-latex-suite'
"Plug 'coot/atp_vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
"Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
"Plug 'easymotion/vim-easymotion'
"Plug 'dag/vim2hs'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'Shougo/neocomplete.vim'
Plug 'wincent/command-t'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'bitc/vim-hdevtools'
Plug 'jceb/vim-orgmode'
"Plug 'hsitz/VimOrganizer'
"Plug 'vimoutliner/vimoutliner'
:Plug 'tpope/vim-speeddating'
"Plug 'amix/vim-zenroom'
Plug 'jamestomasino/vim-writeroom'




call plug#end()


"set default-terminal "screen-256color"
"set incsearch
"set hlsearch
"set cursorline

colorscheme monokai
au BufEnter *.tex source ~/.vim/after/syntax/tex.vim
au BufRead,BufNewFile *.tex setf tex

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'zathura'

set guifont=Courier\ New\ 10


"set thesaurus+=/home/jsmith/mthesaur.txt
"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
"set complete-=k complete+=k




"set tags=./tags,tags;$HOME
"
"let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'
"set iskeyword=@,48-57,_,-,:,192-255

"set modeline
filetype plugin indent on







"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank')
"te -start-insert file buffer
"te -start-insert file buffer file_rec
"replacing unite with ctrl-p
"CtrlP to search in current directory
"let g:ctrlp_working_path_mode = 'c'



"let g:UltiSnipsExpandTrigger="<c-k>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set laststatus=1

let g:table_mode_corner="|"
