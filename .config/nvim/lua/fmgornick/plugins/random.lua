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
}
