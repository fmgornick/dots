return {
  "marko-cerovac/material.nvim",
  "morhetz/gruvbox",
  "nyoom-engineering/oxocarbon.nvim",
  "sainnhe/edge",

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function() require("catppuccin").setup({ flavor = "macchiato" }) end,
  },
  {
    "Mofiqul/dracula.nvim",
    config = function() require("dracula").setup({ theme = "dracula-soft" }) end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function() require("tokyonight").setup({ style = "moon" }) end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("everforest")
      vim.g.everforest_background = "soft"
    end,
  },
}
