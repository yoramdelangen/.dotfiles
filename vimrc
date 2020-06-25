filetype plugin indent on
syntax on
set number relativenumber
set clipboard=unnamed

let mapleader = ","

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/vendor/*,*/storage/*,*/cache/*,*/node_modules/*,*/bower_components/*

" Keys {{{ 
call plug#begin()

" Theme
" Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }

" Vim Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Snippts etc.
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'

" Git Support
Plug 'airblade/vim-gitgutter'

" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

call plug#end()

"
" Set editor configuration
"
" Set default font and size
set guifont=IBMPlexMono:h14
" set linespace=15

set mouse=a

" Set keymapping
nnoremap <C-k><C-b> :NERDTreeToggle<Enter>
map <C-\> :vsplit<CR>
nnoremap <D-d> :vsplit<CR>
nnoremap <S-D-d> :vsplit<CR>
" Drop line while in insert mode
imap <D-BS> <Esc>dd
" change escape key to jj
map <C-[> <Esc>
map <C-c> <Esc>
imap ;; <Esc>

" quick save and exit
map <leader>s :w<cr>
nmap <leader>sq :wq<cr>

map <C-j> :-10<CR>
map <C-k> :+10<CR>

" disable arrowk keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Esc> <Nop>

" " Copy to clipboard
vnoremap  <leader>y  :.w !pbcopy<CR><CR>
nnoremap  <leader>Y  :%w !pbcopy<CR>
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" CtrlP config
":let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NerdTree Config
" Show on startup
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Vim Airline config
" let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Some config for NCM2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
