au BufRead,BufNewFile *.wiki setl filetype=markdown
au BufRead,BufNewFile *.wiki setl syntax=markdown

autocmd VimEnter * cd $VIMHOME | VimwikiIndex
