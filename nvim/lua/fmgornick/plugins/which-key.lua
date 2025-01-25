return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    groups = {
      { "<leader>f", group = "fzf" },
      { "<leader>g", group = "git" },
      { "<leader>i", group = "info" },
      { "<leader>l", group = "language" },
    },
    icons = { rules = false },
    notify = false,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.groups)
  end,
}
