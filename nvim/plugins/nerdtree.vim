Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Other options for NERDTRee
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" NERDTRee keybindings
nnoremap <C-k><C-b> :NERDTreeToggle<CR>
nnoremap <C-l><C-n> :NERDTreeFind<CR>


autocmd FileType vim,tmux,gitcommit,gitconfig,gitrebase let g:nerdtree_tabs_open_on_console_startup=0
autocmd BufNewFile let g:nerdtree_tabs_open_on_console_startup=0
