filetype plugin indent on
syntax on
set number

" Keys {{{
call plug#begin('~/.vim/plugged')

" Theme
" Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" 
" Set editor configuration
"
" Set default font and size
set guifont=IBMPlexMono:h12
set linespace=15

set mouse=a

" Set keymapping
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-\> :vsplit<CR>

map <C-j> :-10<CR>
map <C-k> :+10<CR>

" disable arrowk keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" CtrlP config
":let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Vim Airline config
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1

