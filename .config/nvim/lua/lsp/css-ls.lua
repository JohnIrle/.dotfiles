require'snippets'.use_suggested_mappings()

require'lspconfig'.cssls.setup {capabilities = require'lsp'.add_snippet_capabilites(), on_attach = require'lsp'.common_on_attach}
