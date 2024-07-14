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
    },
    icons = { rules = false },
    modes = { x = false },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.groups)
  end,
}
