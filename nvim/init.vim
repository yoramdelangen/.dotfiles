filetype plugin indent on
syntax enable 

set nocompatible

set cmdheight=2
set encoding=UTF-8
set number
set clipboard=unnamed
set ttyfast
set autoindent
set cursorline

" set default ident width and file specific
set shiftwidth=2 
set smartindent 
set tabstop=4 
set softtabstop=4 
set expandtab
" autocmd Filetype php setlocal tabstop=4 softtabstop=4 shiftwidth=4

" reconfig leader
noremap <silent> <space> <NOP>
let mapleader = " "

" Keys {{{ 
call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'tpope/vim-fugitive'
Plug 'folke/which-key.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'

" Coding
Plug 'b3nj5m1n/kommentary'
" Plug 'gennaro-tedesco/nvim-commaround'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
" Plug 'sheerun/vim-polyglot' 

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Tree sidebar
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

" Theming
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

" Syntax
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

" Formatters
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/markdown.vim
source ~/.config/nvim/plugins/vimwiki.vim

call plug#end()

" Theming an focus
source ~/.config/nvim/plugins/theming.vim
source ~/.config/nvim/plugins/goyo.vim

" Navigation and coding
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/easy-align.vim
source ~/.config/nvim/plugins/kommentary.vim
" source ~/.config/nvim/plugins/nvim-commaround.vim
source ~/.config/nvim/plugins/phpactor.vim
" Register nvim-tree instead of NERDTree

source ~/.config/nvim/plugins/nvim-tree.vim
" source ~/.config/nvim/plugins/nerdtree.vim

" Setup LSP configuration
lua << EOF
  require'lspinstall'.setup() -- important

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
EOF

" Dunno what this does......
set mouse=a

" Clear highlight search
nnoremap <leader>hc :set hlsearch!<cr>

" Set keymapping
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

" Formatter commands
nmap <Leader>p <Plug>(Prettier)

" Improved movement
noremap <silent> <C-K> :-10<CR>
noremap <silent> <C-J> :+10<CR>
nnoremap <S-b> 0 " Jump to the beginning of the line

" Better window movement
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Better identation
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Move line
xnoremap <silent> J :move '>+1<CR>gv-gv'
xnoremap <silent> K :move '<-2<CR>gv-gv'
nnoremap <silent> J :move '>+1<CR>g-g'
nnoremap <silent> K :move '<-2<CR>g-g'

" buffer movement
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" WHAT DOES THIS DOOOO??
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" Move line up or down
" map <M-j> :m .+1<CR>==
" map <M-k> :m .-2<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv
" vnoremap <M-k> :m '<-2<CR>gv=gv

" No recording, its not AVG PROOFFF!
noremap Q <nop>
noremap q <nop>
noremap qq <nop>

" disable arrowk keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Esc> <Nop>

" " Copy to clipboard
" vnoremap  <leader>y  :.w !pbcopy<CR><CR>
" nnoremap  <leader>Y  :%w !pbcopy<CR>
" nnoremap  <leader>y  "+y
" nnoremap  <leader>yy  "+yy
" 
" " " Paste from clipboard
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P

" Source NVIM config
nnoremap <leader>sv :source $MYVIMRC<CR>

" PHP bindings
autocmd FileType php nnoremap <leader>cs :!php-cs-fixer fix -q --stop-on-violation --using-cache=no --show-progress=none %<CR> :echo "PHP CS Fix done! 🔥" <CR><CR>
autocmd FileType php nnoremap <Leader>i :PhpactorImportClass<CR>
autocmd FileType php nnoremap <Leader>gtd :PhpactorGotoDefinition<CR>

" Drop line while in insert mode
" imap <D-BS> <Esc>dd
" change escape key to jj
noremap <C-c> <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" basic mapping to avoid the problem with fast fingers =P
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" INSPIRED BY
" - https://gist.github.com/ocharles/822e0577d7f00c428729338015904cf2
" - https://gist.github.com/erickpatrick/bc11a2a08ce388d751af5718b839ccd1
