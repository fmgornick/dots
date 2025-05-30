vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.autochdir = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "fuzzy", "menuone", "noselect" }
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.mousescroll = { "ver:1", "hor:1" }
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.shiftwidth = 4
vim.opt.showcmd = false
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true
vim.opt.viminfofile = os.getenv("HOME") .. "/.cache/nvim/info"
vim.opt.wrap = false
vim.opt.writebackup = false
