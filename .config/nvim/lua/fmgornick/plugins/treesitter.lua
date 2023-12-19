return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = "all",
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").update({ with_sync = true })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
