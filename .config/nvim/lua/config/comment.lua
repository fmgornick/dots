require("nvim_comment").setup()
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")
