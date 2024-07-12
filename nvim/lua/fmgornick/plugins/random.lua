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
  { "eandrju/cellular-automaton.nvim", lazy = false },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, ft = "yaml" },
  { "norcalli/nvim-colorizer.lua", lazy = false },
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
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-surround", lazy = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  { "xiyaowong/transparent.nvim", lazy = false },
}
