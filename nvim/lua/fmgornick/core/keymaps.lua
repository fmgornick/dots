local utils = require("fmgornick.core.utils")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then opts.desc = opts.desc end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- no format save
map("n", "<c-s>", ":noa w<cr>", { desc = "no format save" })

-- yank stuff
map("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
map("n", "yiF", "<esc>ggVGy", { desc = "yank file contents" })
map("n", "viF", "<esc>ggVG", { desc = "highlight file contents" })

--leader commands
map("n", "<leader>c", ":bn|bd!#<cr>", { desc = "close buffer" })
map("n", "<leader>d", utils.toggle_diff, { desc = "diff windows" })
map("n", "<leader>w", ":w<cr>", { desc = "write buffer" })
map("n", "<leader>q", ":q!<cr>", { desc = "quit" })
map("n", "<leader>Q", ":qa!<cr>", { desc = "quit all" })
map("n", "<leader>h", ":noh<cr>", { desc = "no highlight" })
map("n", "<leader>r", ":set relativenumber!<cr>", { desc = "toggle relativ number" })

-- for clicking on links (mac, { desc = "" })
map("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })

-- chefs kiss
map("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
map("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
map("v", "<", "<gv", { desc = "move block left" })
map("v", ">", ">gv", { desc = "move block right" })

-- buffer info
map("n", "<c-g>", "2<c-g>", { desc = "get buffer info" })

-- command mode stuff
map("ca", "vh", "vert help", { desc = "vertical help menu" })

-- emacs keybinds
map({ "n", "i", "v" }, "<c-n>", "<down>")
map({ "n", "i", "v" }, "<c-p>", "<up>")
map({ "n", "i", "v" }, "<c-f>", "<right>")
map({ "n", "i", "v" }, "<c-b>", "<left>")
map({ "n", "i", "v" }, "<m-f>", "<s-right>")
map({ "n", "i", "v" }, "<m-b>", "<s-left>")
map({ "i", "v" }, "<c-a>", "<home>")
map({ "i", "v" }, "<c-e>", "<end>")
