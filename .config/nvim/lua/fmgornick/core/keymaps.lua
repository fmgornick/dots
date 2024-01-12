local keyset = vim.keymap.set

-- no format save
keyset("n", "<c-s>", ":noa w<cr>", { desc = "no format save" })

-- window navigation
keyset("n", "<c-h>", "<c-w>h", { desc = "window left" })
keyset("n", "<c-j>", "<c-w>j", { desc = "window down" })
keyset("n", "<c-k>", "<c-w>k", { desc = "window up" })
keyset("n", "<c-l>", "<c-w>l", { desc = "window right" })

-- window resizing
keyset("n", "<c-s-h>", ":vertical resize -2<cr>", { desc = "window resize left" })
keyset("n", "<c-s-j>", ":resize +2<cr>", { desc = "window resize down" })
keyset("n", "<c-s-k>", ":resize -2<cr>", { desc = "window resize up" })
keyset("n", "<c-s-l>", ":vertical resize +2<cr>", { desc = "window resize right" })

-- yank stuff
keyset("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
keyset("n", "yiF", "<esc>ggVy", { desc = "yank file contents" })
keyset("n", "viF", "<esc>ggVG", { desc = "highlight file contents" })

--leader commands
keyset("n", "<leader>c",  ":bn|bd!#<cr>", { desc = "close buffer" })
keyset("n", "<leader>w",  ":w<cr>", { desc = "write buffer" })
keyset("n", "<leader>q",  ":q!<cr>", { desc = "quit" })
keyset("n", "<leader>Q",  ":qa!<cr>", { desc = "quit all" })
keyset("n", "<leader>h",  ":noh<cr>", { desc = "no highlight" })

-- for clicking on links (mac, { desc = "" })
keyset("n", "<M-LeftMouse>", "<LeftMouse>", { desc = "click link" })

-- chefs kiss
keyset("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
keyset("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
keyset("v", "<", "<gv", { desc = "move block left" })
keyset("v", ">", ">gv", { desc = "move block right" })

-- terminal stuff
keyset("t", "<c-q>", "<c-\\><c-n>:bd!<cr>", { desc = "quit term" })
keyset("t", "˙", "<c-\\><c-n><c-w>h", { desc = "window left" })
keyset("t", "∆", "<c-\\><c-n><c-w>j", { desc = "window down" })
keyset("t", "˚", "<c-\\><c-n><c-w>k", { desc = "window up" })
keyset("t", "¬", "<c-\\><c-n><c-w>l", { desc = "window right" })
