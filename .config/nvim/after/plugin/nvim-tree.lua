require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = {
        side = 'left',
        width = 30,
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
