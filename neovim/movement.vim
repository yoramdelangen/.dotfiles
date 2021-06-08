" Jump to the start of the line
nnoremap <S-b> ^

" Set keymapping
nmap <leader>\ :vsplit<CR>
nmap <leader>- :split<CR>

" Jump 10 lines up or down
noremap <C-k> :-10<CR>
noremap <C-j> :+10<CR>

" Copy to clipboard
vnoremap  <leader>y  :.w !pbcopy<CR><CR>
nnoremap  <leader>Y  :%w !pbcopy<CR>
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Reload configuration
nnoremap <leader>sv :source $MYVIMRC<CR> :echo "Config reloaded! ✅"<CR>

" disable arrowk keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Esc> <Nop>

