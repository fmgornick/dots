vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").register({
	["/"] = "toggle comment",
	c = "close buffer",
	d = {
		name = "dap",
		c = "continue",
		b = "breakpoint",
		f = "widget frames",
		h = "hover widget",
		i = "step into",
		o = "step over",
		O = "step out",
		p = "preview widget",
		r = "open debug console",
		s = "widget scopes",
		l = "run last",
		u = "toggle dapui",
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
