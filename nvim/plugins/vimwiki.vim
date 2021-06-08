Plug 'vimwiki/vimwiki'

let work_wiki = {}
let work_wiki.path = '~/.vimwiki/work/'
let work_wiki.syntax= 'markdown'
let work_wiki.ext = '.wiki.md'
let work_wiki.auto_toc = 1

let brandweer_wiki = {}
let brandweer_wiki.path = '~/.vimwiki/brandweer/'
let brandweer_wiki.syntax= 'markdown'
let brandweer_wiki.ext = '.wiki.md'
let brandweer_wiki.auto_toc = 1

let personal_wiki = {}
let personal_wiki.path = '~/.vimwiki/personal/'
let personal_wiki.syntax= 'markdown'
let personal_wiki.ext = '.wiki.md'
let personal_wiki.auto_toc = 1

let g:vimwiki_list = [work_wiki, brandweer_wiki, personal_wiki]

au BufRead,BufNewFile *.wiki.md set filetype=vimwiki

" Custom vimwiki keybindings
nmap <leader>w? :h vimwiki-mappings<CR>
autocmd FileType vimwiki nnoremap <buffer> <Leader>wx :VimwikiToggleListItem<CR>

" On make sure to NERDTree and Telescope will load 
" within the proper list space when looking.
" autocmd FileType vimwiki autocmd VimEnter 

