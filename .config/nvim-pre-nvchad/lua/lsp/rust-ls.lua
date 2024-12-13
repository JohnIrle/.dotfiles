local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = require'lsp'.common_on_attach,
  settings = {["rust-analyzer"] = {cargo = {loadOutDirsFromCheck = true}, procMacro = {enable = true}}},
  cmd = {"rustup", "run", "stable", "rust-analyzer"}
}

require('rust-tools').setup {server = {cmd = {"rustup", "run", "stable", "rust-analyzer"}}}
