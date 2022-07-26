set shell=/bin/bash

" remove spaces on save, except markdown, vimwiki etc
let blacklist = ['md', 'markdown', 'vimwiki']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

lua require('yoramdelangen')
