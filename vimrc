filetype plugin indent on
syntax on
set number

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
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'
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
