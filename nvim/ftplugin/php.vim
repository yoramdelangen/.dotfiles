setl ts=4 softtabstop=4 sw=4

" PHP bindings
nnoremap <leader>cs :!php-cs-fixer fix -q --stop-on-violation --using-cache=no --show-progress=none %<CR> :echo "PHP CS Fix done! 🔥" <CR><CR>
"nnoremap <Leader>i :PhpactorImportClass<CR>
"nnoremap <Leader>gtd :PhpactorGotoDefinition<CR>
