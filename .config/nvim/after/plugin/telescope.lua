local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  extensions = {
    file_browser = {
        theme = "ivy",
    },
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('projects')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", {})
vim.keymap.set("n", "<leader>fp", ":Telescope projects<cr>", {})
vim.keymap.set("n", "<leader>fc", ":Telescope file_browser cwd=~/.config/nvim<cr>", {})
