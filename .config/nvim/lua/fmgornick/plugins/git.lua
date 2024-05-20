local utils = require("fmgornick.core.utils")

local function next_select() require("diffview.actions").select_next_entry() end
local function prev_select() require("diffview.actions").select_prev_entry() end

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      signs = {
        add = { text = "│", hl = "GreenSign" },
        change = { text = "│", hl = "YellowSign" },
        delete = { text = "_", hl = "RedSign" },
        untracked = { text = "┆", hl = "BlueSign" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      require("which-key").register({ g = { name = "git" } })
    end,
    keys = {
      { "<leader>gb", ":Gitsigns blame_line<cr>", desc = "blame line", mode = "n" },
      { "<leader>gg", ":LazyGit<cr>", desc = "lazy git", mode = "n" },
      { "<leader>gn", ":Gitsigns next_hunk<cr>", desc = "next hunk", mode = "n" },
      { "<leader>gN", ":Gitsigns prev_hunk<cr>", desc = "previous hunk", mode = "n" },
      { "<leader>gp", ":Gitsigns preview_hunk<cr>", desc = "preview hunk", mode = "n" },
      { "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "reset hunk", mode = { "n", "v" } },
      { "<leader>gR", ":Gitsigns reset_buffer<cr>", desc = "reset buffer", mode = "n" },
      { "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "stage hunk", mode = { "n", "v" } },
      { "<leader>gS", ":Gitsigns stage_buffer<cr>", desc = "stage buffer", mode = "n" },
      { "<leader>gt", ":Gitsigns toggle_current_line_blame<cr>", desc = "toggle line blame", mode = "n" },
      { "<leader>gT", ":Gitsigns toggle_deleted<cr>", desc = "toggle deleted", mode = "n" },
      { "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", desc = "undo stage hunk", mode = "n" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = "lewis6991/gitsigns.nvim",
    keys = { { "<leader>gg", ":LazyGit<cr>", desc = "lazy git", mode = "n" } },
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = {
      file_panel = {
        listing_style = "list",
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {},
        },
      },
      keymaps = {
        file_panel = {
          { "n", "j", next_select, { desc = "next file entry + select" } },
          { "n", "<down>", next_select, { desc = "next file entry + select" } },
          { "n", "k", prev_select, { desc = "previous file entry + select" } },
          { "n", "<up>", prev_select, { desc = "previous file entry + select" } },
          { "n", "q", ":DiffviewClose<cr>", { desc = "close diff view" } },
        },
        file_history_panel = {
          { "n", "j", next_select, { desc = "next file entry + select" } },
          { "n", "<down>", next_select, { desc = "next file entry + select" } },
          { "n", "k", prev_select, { desc = "previous file entry + select" } },
          { "n", "<up>", prev_select, { desc = "previous file entry + select" } },
          { "n", "q", ":DiffviewClose<cr>", { desc = "close diff view" } },
        },
      },
    },
    config = function(_, opts) require("diffview").setup(opts) end,
    keys = {
      { "<leader>gd", utils.diff_view, desc = "git diff", mode = "n" },
      { "<leader>gD", utils.advanced_diff_view, desc = "advanced git diff", mode = "n" },
    },
  },
}
