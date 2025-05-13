return {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
        local ntnav = require("nvim-tmux-navigation")
        vim.keymap.set("n", "<M-h>", ntnav.NvimTmuxNavigateLeft)
        vim.keymap.set("n", "<M-j>", ntnav.NvimTmuxNavigateDown)
        vim.keymap.set("n", "<M-k>", ntnav.NvimTmuxNavigateUp)
        vim.keymap.set("n", "<M-l>", ntnav.NvimTmuxNavigateRight)
    end,
}
