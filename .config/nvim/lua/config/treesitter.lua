require("nvim-treesitter.install").update({ with_sync = true })
require("nvim-treesitter.configs").setup({
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = "all",
        disable = { "latex" },
        additional_vim_regex_highlighting = false,
    },
})
