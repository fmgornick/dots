return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    groups = {
      { "<leader>L", group = "log" },
      { "<leader>d", group = "debug" },
      { "<leader>f", group = "fuzzy-find" },
      { "<leader>g", group = "git" },
      { "<leader>i", group = "info" },
      { "<leader>l", group = "language" },
      { "<leader>r", group = "reload" },
      { "<leader>t", group = "trouble" },
      { "<leader>v", group = "vstasks" },

      -- mode = { "n", "v" },
      -- prefix = "<leader>",
      -- d = { name = "debug" },
      -- f = { name = "fuzzy-find" },
      -- g = { name = "git" },
      -- i = { name = "info" },
      -- l = { name = "language" },
      -- L = { name = "log" },
      -- r = { name = "reload" },
      -- t = { name = "trouble" },
      -- v = { name = "vstasks" },
    },
    icons = { rules = false },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.groups)
  end,
}
