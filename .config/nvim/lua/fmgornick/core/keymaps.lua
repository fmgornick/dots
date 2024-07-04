local custom = require("fmgornick.core.custom")

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

-- window resizing
map("n", "<c-s-h>", ":vertical resize -2<cr>", { desc = "window resize left" })
map("n", "<c-s-j>", ":resize +2<cr>", { desc = "window resize down" })
map("n", "<c-s-k>", ":resize -2<cr>", { desc = "window resize up" })
map("n", "<c-s-l>", ":vertical resize +2<cr>", { desc = "window resize right" })

-- yank stuff
map("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
map("n", "yiF", "<esc>ggVGy", { desc = "yank file contents" })
map("n", "viF", "<esc>ggVG", { desc = "highlight file contents" })

--leader commands
map("n", "<leader>c", ":bn|bd!#<cr>", { desc = "close buffer" })
map("n", "<leader>d", custom.toggle_diff, { desc = "diff windows" })
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

-- vertical help menu shortcut
map("ca", "vh", "vert help", { desc = "vertical help menu" })

-- emacs keybinds
map("c", "<c-x>", "<c-f>")

map("i", "<c-n>", "<down>")
map("i", "<c-p>", "<up>")
map("!", "<c-f>", "<right>")
map("!", "<c-b>", "<left>")
map("!", "<m-f>", "<s-right>")
map("!", "<m-b>", "<s-left>")

map("!", "<c-a>", "<home>")
map("!", "<c-e>", "<end>")

map("!", "<c-k>", "<home>")
map("!", "<c-u>", "<end>")
