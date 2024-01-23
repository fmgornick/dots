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
      { "<leader>gd", ":Gitsigns diffthis<cr>", desc = "get diff", mode = "n" },
      { "<leader>gg", ":LazyGit<cr>", desc = "lazy git", mode = "n" },
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
}