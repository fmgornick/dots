-- i kinda like the mouse :o
vim.opt.mousescroll = "ver:1,hor:0"

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- 4 spaces = correct
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- don't linewrap (most) files
vim.opt.wrap = false

-- save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.writebackup = false

-- search opts
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- looks
vim.opt.termguicolors = true
vim.opt.guifont = "monospace:h17"
vim.opt.title = true

-- keep cursor centered more while scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

-- yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- popup menu
vim.opt.pumheight = 10

-- insert mode completion
vim.opt.completeopt = { "menuone", "noselect" }

-- don't show mode
vim.opt.showmode = false

-- always split right or below
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cursorline = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.laststatus = 3
vim.opt.autochdir = true

-- i like to see what i copy
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Search", timeout = 100 })
	end,
})

-- Populate loclist with the current buffer diagnostics
-- vim.api.nvim_create_autocmd("DiagnosticChanged", {
-- 	callback = function(_)
-- 		vim.diagnostic.setloclist({ open = false })
-- 	end,
-- })
