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

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files hidden=true prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
