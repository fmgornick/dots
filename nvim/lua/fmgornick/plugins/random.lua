return {
    { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", ft = "yaml" },
    { "norcalli/nvim-colorizer.lua", cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" } },
    { "phaazon/hop.nvim", config = true, keys = { { "s", ":HopWord<cr>", desc = "hop", mode = "n" } } },
    { "tpope/vim-abolish", lazy = false },
    { "tpope/vim-repeat", lazy = false },
    { "tpope/vim-surround", lazy = false },
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    { "xiyaowong/transparent.nvim", lazy = false },
}
