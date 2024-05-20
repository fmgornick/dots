local builtin = require("telescope.builtin")
local telescope = require("telescope")
local utils = require("fmgornick.core.utils")

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = "Telescope",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      pickers = {
        buffers = {
          theme = "ivy",
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    },
    keys = {
      { "<leader>fb", builtin.buffers, desc = "buffers" },
      {
        "<leader>fc",
        function() builtin.find_files({ cwd = "~/.config/nvim" }) end,
        desc = "nvim config files",
      },
      { "<leader>fC", builtin.colorscheme, desc = "color schemes" },
      { "<leader>fd", builtin.diagnostics, desc = "buffer diagnostics" },
      {
        "<leader>ff",
        function() builtin.find_files({ cwd = utils.get_root() }) end,
        desc = "find project files",
      },
      {
        "<leader>fF",
        function() builtin.find_files({ cwd = vim.fn.expand("%:p:h") }) end,
        desc = "find folder files",
      },
      {
        "<leader>fg",
        function() builtin.live_grep({ cwd = utils.get_root() }) end,
        desc = "grep project files",
      },
      {
        "<leader>fG",
        function() builtin.live_grep({ cwd = vim.fn.expand("%:p:h") }) end,
        desc = "grep folder files",
      },
      { "<leader>fh", builtin.help_tags, desc = "help tags" },
      { "<leader>fk", builtin.keymaps, desc = "keymaps" },
      { "<leader>fo", builtin.oldfiles, desc = "old files" },
      { "<leader>fq", builtin.quickfix, desc = "quickfix list" },
    },
    config = function(_, opts)
      telescope.setup(opts)
      telescope.load_extension("ui-select")
    end,
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
}
