require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = "all",
		additional_vim_regex_highlighting = false,
	},
})
