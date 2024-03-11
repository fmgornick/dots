local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then opts.desc = "keymaps.lua: " .. opts.desc end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- no format save
map("n", "<c-s>", ":noa w<cr>", { desc = "no format save" })

-- window navigation
map("n", "<c-h>", "<c-w>h", { desc = "window left" })
map("n", "<c-j>", "<c-w>j", { desc = "window down" })
map("n", "<c-k>", "<c-w>k", { desc = "window up" })
map("n", "<c-l>", "<c-w>l", { desc = "window right" })

-- window resizing
map("n", "<c-s-h>", ":vertical resize -2<cr>", { desc = "window resize left" })
map("n", "<c-s-j>", ":resize +2<cr>", { desc = "window resize down" })
map("n", "<c-s-k>", ":resize -2<cr>", { desc = "window resize up" })
map("n", "<c-s-l>", ":vertical resize +2<cr>", { desc = "window resize right" })

-- yank stuff
map("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
map("n", "yiF", "<esc>ggVy", { desc = "yank file contents" })
map("n", "viF", "<esc>ggVG", { desc = "highlight file contents" })

--leader commands
map("n", "<leader>c", ":bn|bd!#<cr>", { desc = "close buffer" })
map("n", "<leader>w", ":w<cr>", { desc = "write buffer" })
map("n", "<leader>q", ":q!<cr>", { desc = "quit" })
map("n", "<leader>Q", ":qa!<cr>", { desc = "quit all" })
map("n", "<leader>h", ":noh<cr>", { desc = "no highlight" })

-- for clicking on links (mac, { desc = "" })
map("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })

-- chefs kiss
map("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
map("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
map("v", "<", "<gv", { desc = "move block left" })
map("v", ">", ">gv", { desc = "move block right" })

-- terminal stuff
map("t", "<c-q>", "<c-\\><c-n>:bd!<cr>", { desc = "quit term" })
map("t", "<m-h>", "<c-\\><c-n><c-w>h", { desc = "window left" })
map("t", "<m-j>", "<c-\\><c-n><c-w>j", { desc = "window down" })
map("t", "<m-k>", "<c-\\><c-n><c-w>k", { desc = "window up" })
map("t", "<m-l>", "<c-\\><c-n><c-w>l", { desc = "window right" })

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
