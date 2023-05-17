require("bufferline").setup()

vim.keymap.set("n", "H", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "L", ":BufferLineCycleNext<cr>")
