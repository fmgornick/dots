return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    groups = {
      mode = { "n", "v" },
      prefix = "<leader>",
      d = { name = "debug" },
      f = { name = "fuzzy-find" },
      g = { name = "git" },
      i = { name = "info" },
      l = { name = "language" },
      L = { name = "log" },
      r = { name = "reload" },
      t = { name = "trouble" },
      v = { name = "vstasks" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.groups)
  end,
}

