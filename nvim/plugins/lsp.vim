Plug 'neovim/nvim-lspconfig'

lua << EOF
vim.lsp.set_log_level("debug")
EOF

" Setup PHP intelephense
" if executable('intelephense')
"   augroup LspPHPIntelephense
"     au!
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'intelephense',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
"         \ 'whitelist': ['php'],
"         \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
"         \ 'workspace_config': {
"         \   'intelephense': {
"         \     'files': {
"         \       'maxSize': 1000000,
"         \       'associations': ['*.php', '*.phtml'],
"         \       'exclude': [],
"         \     },
"         \     'completion': {
"         \       'insertUseDeclaration': v:true,
"         \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
"         \       'triggerParameterHints': v:true,
"         \       'maxItems': 100,
"         \     },
"         \     'format': {
"         \       'enable': v:true
"         \     },
"         \   },
"         \ }
"         \})
"   augroup END
" endif

lua << EOF
local nvim_lsp = require('lspconfig')
nvim_lsp.rust_analyzer.setup{}
EOF
