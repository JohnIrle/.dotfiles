local on_attach = require'completion'.on_attach

require'lspconfig'.clangd.setup {on_attach = on_attach}
