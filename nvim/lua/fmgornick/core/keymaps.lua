local utils = require("fmgornick.core.utils")

--leader commands
vim.keymap.set("n", "<leader>d", utils.toggle_diff, { desc = "diff windows" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<cr>", { desc = "no highlight" })
vim.keymap.set("n", "<leader>r", ":edit!<cr>", { desc = "reset to last saved change" })
vim.keymap.set("n", "<leader>R", ":set relativenumber!<cr>", { desc = "toggle relative number" })

-- lsp commands
vim.keymap.set("n", "grl", utils.setloclist, { desc = "local list" })
vim.keymap.set("n", "grq", utils.setqflist, { desc = "quickfix list" })
vim.keymap.set("n", "grd", vim.lsp.buf.declaration, { desc = "jump to declaration" })
vim.keymap.set("n", "<c-j>", "<c-]>", { desc = "jump to definition of keyword under cursor" })
vim.keymap.set("n", "<c-k>", "<c-t>", { desc = "jump to [count] older entry in tag stack" })
vim.keymap.set("n", "<c-w><c-j>", "<c-w><c-]>", { desc = "jump to definition in split" })

-- move visual blocks better
vim.keymap.set("v", "H", "<gv", { desc = "move block left" })
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
vim.keymap.set("v", "L", ">gv", { desc = "move block right" })

-- random
vim.keymap.set("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })
vim.keymap.set("n", "<c-g>", "2<c-g>", { desc = "get buffer info" })
vim.keymap.set("n", "<c-s>", ":noautocmd w<cr>", { desc = "no format save" })
vim.keymap.set("n", "<c-w>t", "<c-w>T", { desc = "move to new tab" })
vim.keymap.set("n", "yf", ":%y+<cr>", { desc = "yank file contents" })
vim.keymap.set("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
vim.keymap.set("n", "gcd", utils.reroot, { desc = "re-root working directory" })
