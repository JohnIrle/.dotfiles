require'lspconfig'.rust_analyzer.setup {capabilities = require'lsp'.add_snippet_capabilites(), on_attach = require'lsp'.common_on_attach}
