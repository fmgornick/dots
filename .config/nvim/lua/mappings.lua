vim.g.mapleader = " "

-- colons be damned
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q!<cr>")
vim.keymap.set("n", "<leader>Q", ":qa!<cr>")
vim.keymap.set("n", "<leader>c", ":bn|bd!#<cr>")

-- no format save
vim.keymap.set("n", "<c-s>", ":noa w<cr>")

-- get rid of lagging highlights easy
vim.keymap.set("n", "<leader>h", ":noh<cr>")

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
vim.keymap.set("n", "<leader>th", ":25 split<cr>:term<cr>i")
vim.keymap.set("n", "<leader>tv", ":80 vsplit<cr>:term<cr>i")
vim.keymap.set("t", "<c-w>", "<c-\\><c-n><c-w>w")
vim.keymap.set("t", "<c-q>", "<c-\\><c-n>:bd!<cr>")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>w")

-- chefs kiss
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv")

-- faster indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- copy shortcuts
vim.keymap.set("n", "<leader>yf", ":let @+=expand('%:p')<cr>")
vim.keymap.set("n", "<leader>yy", "ggVGy<c-o>")
