require("tokyonight").setup({
	style = "moon",
})

require("lualine").setup({
	options = { theme = "tokyonight" },
})

vim.cmd.colorscheme("tokyonight")
