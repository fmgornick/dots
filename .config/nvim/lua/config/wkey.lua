vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").register({
	["/"] = "toggle comment",
	c = "close buffer",
	d = {
		name = "debug",
		b = "toggle break",
		c = "continue",
		o = "step out",
		s = "step into",
		S = "step over",
		t = "open dapui",
	},
	e = "toggle nvim-tree",
	f = {
		name = "fuzzy",
		b = "file browser",
		c = "nvim config files",
		C = "color schemes",
		f = "find files",
		g = "live grep",
		h = "help tags",
		k = "keymaps",
		o = "old files",
		p = "projects",
	},
	l = {
		name = "lsp info",
		i = "current buffer LSPs",
		m = "mason info",
		n = "null-ls info",
	},
	q = "quit",
	t = {
		name = "terminal",
		v = "vertical",
		h = "horizontal",
	},
	w = "write",
	y = "which_key_ignore",
}, { prefix = "<leader>" })
