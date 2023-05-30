local lsps = {
	"clangd",
	"cssls",
	"gopls",
	"html",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"texlab",
	"yamlls",
}

local lsp = require("lspconfig")

require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps,
	automatic_installation = false,
})

lsp.lua_ls.setup(require("lsp-zero").nvim_lua_ls())

lsp.yamlls.setup({
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

vim.keymap.set("n", "<leader>li", ":LspInfo<cr>")
vim.keymap.set("n", "<leader>lm", ":Mason<cr>")
vim.keymap.set("n", "<leader>ln", ":NullLsInfo<cr>")
