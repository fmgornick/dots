local lsp = require("lsp-zero").preset()
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"gopls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"texlab",
		"yamlls",
	},
	automatic_installation = false,
})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

lsp.setup()

vim.keymap.set("n", "<leader>li", ":LspInfo<cr>")
vim.keymap.set("n", "<leader>lm", ":Mason<cr>")
vim.keymap.set("n", "<leader>ln", ":NullLsInfo<cr>")
