vim.g.mapleader = " "

-- colons be damned
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>c", ":bd<cr>")

-- get rid of lagging highlights easy
vim.keymap.set("n", "<leader>h", ":noh<cr>")

-- no format save
vim.keymap.set("n", "<c-s>", ":noautocmd w<cr>")

-- window navigation
vim.keymap.set("n", "<c-h>", "<C-w>h")
vim.keymap.set("n", "<c-j>", "<C-w>j")
vim.keymap.set("n", "<c-k>", "<C-w>k")
vim.keymap.set("n", "<c-l>", "<C-w>l")

-- window resizing
vim.keymap.set("n", "<c-s-h>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<c-s-j>", ":resize +2<cr>")
vim.keymap.set("n", "<c-s-k>", ":resize -2<cr>")
vim.keymap.set("n", "<c-s-l>", ":vertical resize +2<cr>")

-- terminal stuff
vim.keymap.set("n", "<leader>th", ":25 split<cr>:term<cr>i")
vim.keymap.set("n", "<leader>tv", ":80 vsplit<cr>:term<cr>i")
vim.keymap.set("t", "<c-w>", "<C-\\><c-n><c-w>w")
vim.keymap.set("t", "<c-q>", "<C-\\><c-n>:bd!<cr>")

-- chefs kiss
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- faster indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- copy current file path
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%:p')<cr>")
