local utils = require("fmgornick.core.utils")
local map = utils.keymap

--leader commands
map("n", "<leader>d", utils.toggle_diff, { desc = "diff windows" })
map("n", "<leader>h", ":noh<cr>", { desc = "no highlight" })
map("n", "<leader>r", ":e!<cr>", { desc = "reset to last saved change" })
map("n", "<leader>R", ":set relativenumber!<cr>", { desc = "toggle relative number" })

-- lsp commands
map("n", "grl", vim.diagnostic.setloclist, { desc = "vim.diagnostic.setloclist()" })
map("n", "grq", vim.diagnostic.setqflist, { desc = "vim.diagnostic.setqflist()" })
map("n", "grd", vim.lsp.buf.declaration, { desc = "vim.lsp.buf.declaration()" })
map("n", "<c-[>", "<c-t>", { desc = "jump to [count] older entry in tag stack" })

-- move visual blocks better
map("v", "H", "<gv", { desc = "move block left" })
map("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
map("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
map("v", "L", ">gv", { desc = "move block right" })

-- random
map("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })
map("n", "<c-g>", "2<c-g>", { desc = "get buffer info" })
map("n", "<c-s>", ":noa w<cr>", { desc = "no format save" })
map("n", "<c-w>t", "<c-w>T", { desc = "move to new tab" })
map("n", "yf", ":%y+<cr>", { desc = "yank file contents" })
map("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
