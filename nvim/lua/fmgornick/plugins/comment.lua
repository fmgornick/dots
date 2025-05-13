return {
    "tpope/vim-commentary",
    lazy = false,
    keys = {
        { "<leader>/", ":Commentary<cr>", desc = "toggle comment", mode = "n" },
        { "<leader>/", ":'<,'>Commentary<cr>gv", desc = "toggle comment", mode = "v" },
    },
}
