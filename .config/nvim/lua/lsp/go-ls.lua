local on_attach = require'completion'.on_attach
require'lspconfig'.gopls.setup {on_attach = on_attach}
