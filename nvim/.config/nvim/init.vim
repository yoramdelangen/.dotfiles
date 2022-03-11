set shell=/bin/bash

" In case i make again typo's
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

" Helper commands to make help out
command! WQ wq
command! Wq wq
command! W w
command! Q q

command! Format execute 'lua vim.lsp.buf.formatting_sync()'

" remove spaces on save, except markdown, vimwiki etc
let blacklist = ['md', 'markdown', 'vimwiki']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

lua require('yoramdelangen')

" make background transparent
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE
