local filetypes = {javacript = "eslint", javascriptreact = "eslint", typescript = "eslint", typescriptreact = "eslint", lua = "lua", css = "css"}

local formatFiletypes = {
  css = 'pretier',
  javascript = 'eslint',
  javascriptreact = 'eslint',
  json = 'prettier',
  scss = 'prettier',
  typescript = 'eslint',
  typescriptreact = 'eslint',
  markdown = 'prettier'
}

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
      message = "[eslint] ${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}

local formatters = {
  eslint_d = {command = 'eslint_d', args = {'--stdin', '--stdin-filename', '%filename', '--fix-to-stdout'}, rootPatterns = {'.git'}},
  prettier = {command = 'prettier', args = {'--stdin-filepath', '%filename'}}
}

require'lspconfig'.diagnosticls.setup {
  filetypes = vim.tbl_keys(filetypes),
  init_options = {filetypes = filetypes, formatters = formatters, linters = linters, formatFiletypes = formatFiletypes}
}
