Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

set nofoldenable

" do not fold
let g:markdown_folding = 0
" do not use conceal feature, the implementation is not so good
"let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
" disable math tex conceal feature
"let g:tex_conceal = ""
"let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1 
let g:vim_markdown_toml_frontmatter = 1  
let g:vim_markdown_json_frontmatter = 1 

