local sumneko_root_path = '/Users/john/.config/nvim/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local on_attach = require'completion'.on_attach

local filetypes = {
	javacript = "eslint",
	javascriptreact = "eslint",
	typescript = "eslint",
	typescriptreact = "eslint"
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
			message = "${message} [${ruleId}]",
			security = "severity"
		},
		securities = {[2] = "error", [1] = "warning"}
	}
}

local formatters = {
	prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}

local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier"
}

require'lspconfig'.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
		formatters = formatters,
		formatFiletypes = formatFiletypes
  }
}

require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.gopls.setup{ on_attach=on_attach }

require'lspconfig'.sumneko_lua.setup {
	on_attach = on_attach,
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you are using. LuaJIT for NVIM
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
}
