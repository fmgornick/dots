return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.mapleader = " "
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    normal_maps = {
      mode = "n",
      ["<c-s>"] = { ":noa w<cr>", "no format save" },

      ["<c-h>"] = { "<c-w>h", "window left" },
      ["<c-j>"] = { "<c-w>j", "window down" },
      ["<c-k>"] = { "<c-w>k", "window up" },
      ["<c-l>"] = { "<c-w>l", "window right" },

      ["<c-s-h>"] = { ":vertical resize -2<cr>", "window resize left" },
      ["<c-s-j>"] = { ":resize +2<cr>", "window resize down" },
      ["<c-s-k>"] = { ":resize -2<cr>", "window resize up" },
      ["<c-s-l>"] = { ":vertical resize +2<cr>", "window resize right" },

      ["<m-leftmouse>"] = { "<leftmouse" },
    },
    visual_maps = {
      mode = "v",
      J = { ":move '>+1<cr>gv=gv", "move block down" },
      K = { ":move '<-2<cr>gv=gv", "move block up" },
      ["<"] = { "<gv", "indent left re-highlight" },
      [">"] = { ">gv", "indent right re-highlight" },
    },
    plugin_groups = {
      mode = { "n", "v" },
      prefix = "<leader>",
      d = { name = "debug" },
      i = { name = "info" },
      r = { name = "reload" },
      t = { name = "trouble" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.normal_maps)
    wk.register(opts.visual_maps)
    wk.register(opts.plugin_groups)
  end,
}
