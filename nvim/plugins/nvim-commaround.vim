lua << EOF
require('nvim-commaround.config').config["php"] = {single = "//", block = {left = "/*", right = "*/"}}
EOF

vmap <leader>c <Plug>ToggleCommaround
nmap <leader>cc <Plug>ToggleCommaround
