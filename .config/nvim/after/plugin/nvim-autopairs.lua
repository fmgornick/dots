require("nvim-autopairs").setup()

vim.keymap.set("n", "<leader>/", ":CommentToggle<cr>")
vim.keymap.set("v", "<leader>/", ":CommentToggle<cr>")
