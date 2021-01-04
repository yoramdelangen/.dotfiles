filetype plugin indent on
syntax on

set cmdheight=2
set encoding=UTF-8
set number relativenumber
set clipboard=unnamed
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
""set nocursorline
"set lazyredraw
set ttyfast

let mapleader = ";"

" Keys {{{ 
call plug#begin('~/.config/nvim/plugged')

" Theme
    " Plug 'mhartington/oceanic-next'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'gruvbox-community/gruvbox'

" Tools
    "Plug 'scrooloose/nerdtree'
    "Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'sheerun/vim-polyglot'

    " tabular plugin is used to format tables
    Plug 'godlygeek/tabular'
" Formatters
    Plug 'editorconfig/editorconfig-vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'friendsofphp/php-cs-fixer'
    Plug 'stephpy/vim-php-cs-fixer'

" Syntax
    Plug 'elzr/vim-json'
    Plug 'plasticboy/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

call plug#end()

" THEMING
colorscheme gruvbox

;
" Set editor configuration
"
" Set default font and size
set guifont=FiraMono:h15

" Dunno what this does......
set mouse=a

" Set keymapping
nnoremap <C-k><C-b> :NERDTreeToggle<Enter>
nmap <leader>\ :vsplit<CR>
nmap <leader>- :split<CR>

" Drop line while in insert mode
" imap <D-BS> <Esc>dd
" change escape key to jj
map <C-[> <Esc>
map <C-c> <Esc>
imap ;; <Esc>

map <C-p> :GFiles --cached --others --exclude-standard<CR>
nmap <C-e> :Ex<CR>
nmap <C-e><C-n> :Ex<CR> %
nmap <C-e><C-d> :Ex<CR> d

" Formatter commands
nmap <Leader>p <Plug>(Prettier)
nnoremap <M-C-l> :call PhpCsFixerFixFile()<CR>

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
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
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

nnoremap <leader>sv :source $MYVIMRC<CR>

" find through project
nnoremap <C-S-f> :Ag<CR>

" COC shortcutsc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Auto close some tags
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" do not use conceal feature, the implementation is not so good
"let g:vim_markdown_conceal = 0

" disable math tex conceal feature
"let g:tex_conceal = ""
"let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1 
let g:vim_markdown_toml_frontmatter = 1  
let g:vim_markdown_json_frontmatter = 1 

if filereadable(expand("~/.config/nvim/vimrc_background"))
  let base16colorspace=256          " Remove this line if not necessary
  source ~/.config/nvim/vimrc_background
endif
