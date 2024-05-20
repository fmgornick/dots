return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "parent dir", mode = { "n", "v" } } },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<cr>"] = "actions.select",
      ["<c-s>"] = "actions.select_split",
      ["<c-v>"] = "actions.select_vsplit",
      ["<c-p>"] = "actions.preview",
      ["-"] = "actions.parent",
      q = "actions.close",
    },
    use_default_keymaps = false,
  },
  config = function(_, opts) require("oil").setup(opts) end,
}
