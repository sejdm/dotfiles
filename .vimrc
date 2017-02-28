"inoremap jk <esc>
set go-=m  "remove menu bar
set mouse=a
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L
"set t_Co=256
set smartcase
set autochdir
set hidden

call plug#begin('~/.vim/plugged')

"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'

"Plug 'Valloric/YouCompleteMe'
Plug 'therubymug/vim-pyte'
Plug 'thinca/vim-guicolorscheme'
Plug 'endel/vim-github-colorscheme'
Plug 'eagletmt/ghcmod-vim'
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
"Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'KevinGoodsell/vim-csexact'
"Plug 'jeetsukumaran/vim-filebeagle'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
"Plug 'gerw/vim-latex-suite'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'godlygeek/csapprox'
"Plug 'coot/atp_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
"Plug 'lukerandall/haskellmode-vim'
Plug 'enomsg/vim-haskellConcealPlus'
"Plug 'begriffs/haskell-vim-now'
"Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
"Plug 'easymotion/vim-easymotion'
"Plug 'dag/vim2hs'
"Plug 'enomsg/vim-haskellConcealPlus'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-sensible'
"Plug 'Shougo/neocomplete.vim'
"Plug 'wincent/command-t'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'bitc/vim-hdevtools'
Plug 'jceb/vim-orgmode'
"Plug 'hsitz/VimOrganizer'
"Plug 'vimoutliner/vimoutliner'
Plug 'junegunn/goyo.vim'
":Plug 'tpope/vim-speeddating'
"Plug 'mikewest/vimroom'
"Plug 'amix/vim-zenroom'
"Plug 'jamestomasino/vim-writeroom'




call plug#end()


"set default-terminal "screen-256color"
"set incsearch
"set hlsearch
"set cursorline

"colorscheme pyte
"au BufEnter *.tex source ~/.vim/after/syntax/tex.vim
"au BufRead,BufNewFile *.tex setf tex
"au BufEnter * hi clear Conceal
au BufRead hi Conceal cterm=NONE ctermbg=NONE ctermfg=DarkRed

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
set tabstop=2 shiftwidth=2 expandtab

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let $PATH = $PATH . ':' . expand('~/.local/bin')
let $PATH = expand('~/.local/bin') . ':' . $PATH


"highlight Data cterm=bold ctermfg=Grey
"let g:syntastic_mode_map = { 'passive_filetypes': ['hs'] }
"syntax enable
"set background=light
"colorscheme solarized


if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif



" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

"highlight Function cterm=italic
"highlight Function cterm=italic ctermfg=Blue
"highlight Structure cterm=bold
"highlight Structure cterm=bold ctermfg=Green
"highlight Comment ctermfg=Grey
"hi Conceal cterm=NONE ctermbg=NONE ctermfg=Black
"colorscheme apprentice


if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme pyte
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme pyte
endif

hi Conceal none
