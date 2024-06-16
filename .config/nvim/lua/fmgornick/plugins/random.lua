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
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "xiyaowong/transparent.nvim", lazy = false },
  { "norcalli/nvim-colorizer.lua", lazy = false },
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
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, ft = "yaml" },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#00DDDD" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
    },
  },
}
