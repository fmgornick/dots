return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    keys = {
      {
        "<leader>/",
        "<Plug>(comment_toggle_linewise_current)",
        desc = "toggle comment",
        mode = "n",
      },
      {
        "<leader>/",
        "<Plug>(comment_toggle_linewise_visual)gv",
        desc = "toggle comment",
        mode = "v",
      },
    },
  },
  {
    "phaazon/hop.nvim",
    config = true,
    keys = { { "s", ":HopWord<cr>", desc = "hop", mode = "n" } },
  },
  { "skywind3000/asyncrun.vim", lazy = false },
  { "eandrju/cellular-automaton.nvim", lazy = false },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = "nvim-lua/plenary.nvim",
    keys = { { "<leader>x", "<Plug>RestNvim", desc = "http request", mode = { "n", "v" } } },
    config = true,
  },
  {
    "toppair/peek.nvim",
    event = "VeryLazy",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  { "tpope/vim-abolish", lazy = false },
  { "xiyaowong/transparent.nvim", lazy = false },
}
