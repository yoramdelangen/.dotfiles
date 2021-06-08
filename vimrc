filetype plugin indent on
syntax on

set cmdheight=2
set encoding=UTF-8
set number relativenumber
set clipboard=unnamed
set shiftwidth=2 autoindent smartindent tabstop=4 softtabstop=4 expandtab
""set nocursorline
"set lazyredraw
set ttyfast

let mapleader = ";"

"" KITE settings
" All the languages Kite supports
let g:kite_supported_languages = ['*']

" Keys {{{ 
call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/theming.vim
source ~/.config/nvim/plugins/syntax_format.vim
" source ~/.config/nvim/plugins/fzf.vim
" source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/markdown.vim
" source ~/.config/nvim/plugins/coc.vim
" source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/easy-align.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vimwiki.vim

call plug#end()

" THEMING
colorscheme gruvbox

" Telescope settings
lua << EOF
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*"
        }
    }
}
EOF

" Set editor configuration
"
" Set default font and size
set guifont=CozetteVector:h14

" Dunno what this does......
set mouse=a

" Set keymapping
nmap <leader>\ :vsplit<CR>
nmap <leader>- :split<CR>

" Drop line while in insert mode
" imap <D-BS> <Esc>dd
" change escape key to jj
map <C-[> <Esc>
map <C-c> <Esc>

" map <C-p> :Files<CR>
nmap <C-e> :Ex<CR>
nmap <C-e><C-n> :Ex<CR> %
nmap <C-e><C-d> :Ex<CR> d

" Formatter commands
nmap <Leader>p <Plug>(Prettier)

" quick save and exit
nnoremap <leader>s :w<cr>
nnoremap <leader>sq :wq<cr>

noremap <C-k> :-10<CR>
noremap <C-j> :+10<CR>

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

" find through project
nnoremap <C-S-f> :Ag<CR>


" Auto close some tags
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

if filereadable(expand("~/.config/nvim/vimrc_background"))
  let base16colorspace=256          " Remove this line if not necessary
  source ~/.config/nvim/vimrc_background
endif

" INSPIRED BY
" - https://gist.github.com/ocharles/822e0577d7f00c428729338015904cf2
