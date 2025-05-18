local utils = require("fmgornick.core.utils")
local map = utils.keymap

--leader commands
map("n", "<leader>d", utils.toggle_diff, { desc = "diff windows" })
map("n", "<leader>h", ":noh<cr>", { desc = "no highlight" })
map("n", "<leader>r", ":e!<cr>", { desc = "reset to last saved change" })
map("n", "<leader>R", ":set relativenumber!<cr>", { desc = "toggle relative number" })

-- move visual blocks better
map("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
map("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
map("v", "<", "<gv", { desc = "move block left" })
map("v", ">", ">gv", { desc = "move block right" })

-- emacs keybinds
map({ "n", "i", "v" }, "<c-n>", "<down>")
map({ "n", "i", "v" }, "<c-p>", "<up>")
map({ "n", "i", "v" }, "<c-f>", "<right>")
map({ "n", "i", "v" }, "<c-b>", "<left>")
map({ "n", "i", "v" }, "<m-f>", "<s-right>")
map({ "n", "i", "v" }, "<m-b>", "<s-left>")
map({ "i", "v" }, "<c-a>", "<home>")
map({ "i", "v" }, "<c-e>", "<end>")

-- random
map("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })
map("n", "<c-g>", "2<c-g>", { desc = "get buffer info" })
map("n", "<c-s>", ":noa w<cr>", { desc = "no format save" })
map("n", "<c-w>t", "<c-w>T", { desc = "move to new tab" })
map("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
map({ "i", "n", "s" }, "<c-c>", utils.disable_snippet, { desc = "exit snippet select-mode" })
