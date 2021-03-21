local filetypes = {javacript = "eslint", javascriptreact = "eslint", typescript = "eslint", typescriptreact = "eslint", lua = "lua", css = "css"}

local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}

require'lspconfig'.diagnosticls.setup {filetypes = vim.tbl_keys(filetypes), init_options = {filetypes = filetypes, linters = linters}}
