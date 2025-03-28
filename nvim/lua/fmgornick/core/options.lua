vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- i kinda like the mouse :o
vim.opt.mousescroll = "ver:1,hor:0"

-- line numbering
vim.opt.number = true

-- 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- don't linewrap (most) files
vim.opt.wrap = false

-- save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.viminfofile = os.getenv("HOME") .. "/.cache/nvim/info"

-- search opts
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- looks
vim.opt.termguicolors = true
vim.opt.title = true

-- keep cursor centered more while scrolling
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

-- yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- always change working dir
vim.opt.autochdir = true

-- popup menu
vim.opt.pumheight = 10

-- insert mode completion
vim.opt.completeopt = { "menuone", "noselect" }

-- always split right or below
vim.opt.splitbelow = true
vim.opt.splitright = true

-- statusline shit
vim.opt.cursorline = false
vim.opt.inccommand = "split"
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.showtabline = 0
