vim.g.mapleader = " "

-- colons be damned
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>c", ":bd<cr>")

-- get rid of lagging highlights easy
vim.keymap.set("n", "<leader>h", ":noh<cr>")

-- nice file tree (no more netrw)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- buffer navigation
vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>")

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

-- chefs kiss
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- faster indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n","<leader>/" ,":CommentToggle<cr>")
