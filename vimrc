filetype plugin indent on
syntax on

set cmdheight=2
set encoding=UTF-8
set number relativenumber
set clipboard=unnamed
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab

"let mapleader = ","
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/vendor/*,*/storage/*,*/cache/*,*/node_modules/*,*/bower_components/*

" Keys {{{ 
call plug#begin('~/.config/nvim/plugged')

" Theme
    " Plug 'mhartington/oceanic-next'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'gruvbox-community/gruvbox'

" Tools
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'sheerun/vim-polyglot'

    " tabular plugin is used to format tables
    Plug 'godlygeek/tabular'

" Syntax
    Plug 'elzr/vim-json'
    Plug 'plasticboy/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

call plug#end()

" THEMING
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

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
" imap <D-BS> <Esc>dd
" change escape key to jj
map <C-[> <Esc>
map <C-c> <Esc>
imap ;; <Esc>

map <C-p> :GFiles<CR>

" quick save and exit
map <leader>s :w<cr>
nmap <leader>sq :wq<cr>

map <C-k> :-10<CR>
map <C-j> :+10<CR>

" Move line up or down
"xnoremap K :move '<-2<CR>gv-gv
"xnoremap J :move '>+1<CR>gv-gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap Q <nop>
noremap qq :noh<CR>

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

" NerdTree Config
" Show on startup
" autocmd StdinReadPre * let s:std_in=1
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
let g:vim_markdown_frontmatter = 1 
let g:vim_markdown_toml_frontmatter = 1  
let g:vim_markdown_json_frontmatter = 1 

