vim.g.mapleader = " "

-- no format save
vim.keymap.set("n", "<c-s>", ":noa w<cr>")

-- don't always want to delete into register
vim.keymap.set("n", "x", '"_x')

-- change increment and decrement
vim.keymap.set("n", "+", "<c-a>")
vim.keymap.set("n", "-", "<c-x>")

-- highlight all
vim.keymap.set("n", "<c-a>", "ggVG$")

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
vim.keymap.set("n", "<c-t><c-n>", ":tabnew %<cr>")
vim.keymap.set("n", "<c-t><c-l>", ":tabnext<cr>")
vim.keymap.set("n", "<c-t><c-h>", ":tabprevious<cr>")
vim.keymap.set("t", "<c-t><c-n>", "<c-\\><c-n>:tabnew %<cr>i")
vim.keymap.set("t", "<c-t><c-l>", "<c-\\><c-n>:tabnext<cr>i")
vim.keymap.set("t", "<c-t><c-h>", "<c-\\><c-n>:tabprevious<cr>i")

-- terminal stuff
vim.keymap.set("t", "<c-w>", "<c-\\><c-n><c-w>w")
vim.keymap.set("t", "<c-q>", "<c-\\><c-n>:bd!<cr>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>w")

-- chefs kiss
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- faster indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- better functionality for 's' key
vim.keymap.set("n", "s", ":HopChar2<cr>", { silent = true })
vim.keymap.set("n", "S", ":HopWord<cr>", { silent = true })

-- easier cycling between buffers
vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>")
