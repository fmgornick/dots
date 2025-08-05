return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufEnter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").update({ with_sync = true })
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = "all",
                disable = { "latex" },
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            matchup = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",
                    },
                    include_surrounding_whitespace = false,
                },
            },
        })
    end,
}
