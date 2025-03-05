return {
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
        config = function()
            local ntnav = require("nvim-tmux-navigation")
            vim.keymap.set("n", "<M-h>", ntnav.NvimTmuxNavigateLeft)
            vim.keymap.set("n", "<M-j>", ntnav.NvimTmuxNavigateDown)
            vim.keymap.set("n", "<M-k>", ntnav.NvimTmuxNavigateUp)
            vim.keymap.set("n", "<M-l>", ntnav.NvimTmuxNavigateRight)
        end,
    },
    { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, ft = "yaml" },
    { "norcalli/nvim-colorizer.lua", cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" } },
    {
        "phaazon/hop.nvim",
        config = true,
        keys = { { "s", ":HopWord<cr>", desc = "hop", mode = "n" } },
    },
    { "tpope/vim-abolish", lazy = false },
    {
        "tpope/vim-commentary",
        lazy = false,
        keys = {
            { "<leader>/", ":Commentary<cr>", desc = "toggle comment", mode = "n" },
            { "<leader>/", ":'<,'>Commentary<cr>gv", desc = "toggle comment", mode = "v" },
        },
    },
    { "tpope/vim-surround", lazy = false },
    { "tpope/vim-repeat", lazy = false },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    { "xiyaowong/transparent.nvim", lazy = false },
}
