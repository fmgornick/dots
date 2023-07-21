vim.g.mapleader = " "

-- no format save
vim.keymap.set("n", "<c-s>", ":noa w<cr>")

-- don't always want to delete into register
vim.keymap.set("n", "x", '"_x')

-- window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- window resizing
vim.keymap.set("n", "<c-s-h>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<c-s-j>", ":resize +2<cr>")
vim.keymap.set("n", "<c-s-k>", ":resize -2<cr>")
vim.keymap.set("n", "<c-s-l>", ":vertical resize +2<cr>")

-- tab stuff
vim.keymap.set("n", "<c-t>n", ":tabnew %<cr>")
vim.keymap.set("t", "<c-t>n", "<c-\\><c-n>:tabnew %<cr>i")

-- terminal stuff
vim.keymap.set("t", "<c-q>", "<c-\\><c-n>:bd!<cr>")
-- normal <Alt> mappings are fucky
vim.keymap.set("t", "˙", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "∆", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "˚", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "¬", "<c-\\><c-n><c-w>l")

-- chefs kiss
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- faster indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
