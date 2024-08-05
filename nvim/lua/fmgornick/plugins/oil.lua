return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "parent dir", mode = { "n", "v" } } },
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = false,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<cr>"] = "actions.select",
      ["<c-w>s"] = "actions.select_split",
      ["<c-w>v"] = "actions.select_vsplit",
      ["-"] = "actions.parent",
      ["<leader>p"] = "actions.preview",
      ["H"] = "actions.toggle_hidden",
      q = "actions.close",
    },
    use_default_keymaps = false,
  },
  config = function(_, opts) require("oil").setup(opts) end,
}
