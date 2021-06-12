filetype plugin indent on
syntax on

set nocompatible

set cmdheight=2
set encoding=UTF-8
set number relativenumber
set clipboard=unnamed
set shiftwidth=2 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set ttyfast

let mapleader = ";"

" Keys {{{ 
call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

" Coding
Plug 'b3nj5m1n/kommentary'
" Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
" Plug 'editorconfig/editorconfig-vim'

" Tree sidebar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/theming.vim
source ~/.config/nvim/plugins/syntax_format.vim
" source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/markdown.vim
" source ~/.config/nvim/plugins/coc.vim
" source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/easy-align.vim
source ~/.config/nvim/plugins/vimwiki.vim

call plug#end()

finish

" THEMING
colorscheme gruvbox

" Telescope settings
lua << EOF
-- Register Telescope and it's configuration
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*"
        }
    }
}

-- Register Kommantary
  vim.g.kommentary_create_default_mappings = false
  vim.g.use_consistent_indentation = true

  vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
  vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
  vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default", {})

  require('kommentary.config').configure_language("php", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
  })
EOF

" Register nvim-tree instead of NERDTree
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/telescope.vim

" Set editor configuration
"
" Set default font and size
set guifont=CozetteVector:h14

" Dunno what this does......
set mouse=a

" Set keymapping
nmap <leader>\ :vsplit<CR>
nmap <leader>- :split<CR>


" map <C-p> :Files<CR>
" nmap <C-e><C-n> :Ex<CR> %
" nmap <C-e><C-d> :Ex<CR> d

" Formatter commands
nmap <Leader>p <Plug>(Prettier)

" quick save and exit
nnoremap <leader>s :w<cr>
nnoremap <leader>sq :wq<cr>

" Improved movement
noremap <C-k> :-10<CR>
noremap <C-j> :+10<CR>
noremap <S-b> ^ " Jump to the beginning of the line

map <D-t> :echo "Super was clicked with super key"<CR>

" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" Move line up or down
"xnoremap K :move '<-2<CR>gv-gv
"xnoremap J :move '>+1<CR>gv-gv
map <M-j> :m .+1<CR>==
map <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

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

nnoremap <leader>sv :source $MYVIMRC<CR> :echo "Config reloaded! ✅"<CR>

" PHP
nnoremap <leader>cs :!php-cs-fixer fix -q --stop-on-violation --using-cache=no --show-progress=none %<CR> :echo "PHP CS Fix done! 🔥" <CR><CR>
autocmd FileType php nnoremap <Leader>e :call PhpInsertUse()<CR>


" Drop line while in insert mode
" imap <D-BS> <Esc>dd
" change escape key to jj
map <C-[> <Esc>
map <C-c> <Esc>

" basic mapping to avoid the problem with fast fingers =P
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" INSPIRED BY
" - https://gist.github.com/ocharles/822e0577d7f00c428729338015904cf2
" - https://gist.github.com/erickpatrick/bc11a2a08ce388d751af5718b839ccd1
