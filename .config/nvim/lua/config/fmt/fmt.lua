local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

-- local formatters = {
-- 	autopep8 = formatting.autopep8,
-- 	clang_format = formatting.clang_format.with({
-- 		extra_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
-- 	}),
-- 	prettier = formatting.prettier,
-- 	rustfmt = formatting.rustfmt,
-- 	stylua = formatting.stylua,
-- }

null_ls.setup({
	debug = true,

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,

	sources = {
		formatting.autopep8,
		formatting.clang_format.with({
			extra_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
		}),
		formatting.prettier,
		formatting.rustfmt,
		formatting.stylua,

		code_actions.gitsigns,
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"autopep8",
		"clang_format",
		"prettier",
		"rustfmt",
		"stylua",
	},
})
