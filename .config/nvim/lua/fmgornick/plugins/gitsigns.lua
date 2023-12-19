local gs = package.loaded.gitsigns

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  opts = {
    signs = {
      add = { text = "│", hl = "GreenSign" },
      change = { text = "│", hl = "YellowSign" },
      delete = { text = "_", hl = "RedSign" },
      untracked = { text = "┆", hl = "BlueSign" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function() 
      local keyset = vim.keymap.set
      keyset("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "blame line" })
      keyset("n", "<leader>gd", gs.diffthis, { desc = "get diff" })
      keyset("n", "<leader>gg", ":LazyGit<cr>", { desc = "lazy git" })
      keyset("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
      keyset("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
      keyset("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })
      keyset("n", "<leader>gs", gs.stage_hunk, { desc = "stage hunk" })
      keyset("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
      keyset("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "toggle line blame" })
      keyset("n", "<leader>gT", gs.toggle_deleted, { desc = "toggle deleted" })
      keyset("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
      keyset(
        "v", 
        "<leader>gr", 
        function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        {desc = "reset selected"}
      )
      keyset(
        "v", 
        "<leader>gr", 
        function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        {desc = "stage selected"}
      )
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    require("which-key").register({ g = { name = "git" } })
  end,
  --keys = {
  --  { "<leader>gb", function() gs.blame_line({ full = true }) end, desc = "blame line", mode = "n" },
  --  { "<leader>gd", gs.diffthis, desc = "get diff", mode = "n" },
  --  { "<leader>gg", ":LazyGit<cr>", desc = "lazy git", mode = "n" },
  --  { "<leader>gp", gs.preview_hunk, desc = "preview hunk", mode = "n" },
  --  { "<leader>gr", gs.reset_hunk, desc = "reset hunk", mode = "n" },
  --  { "<leader>gR", gs.reset_buffer, desc = "reset buffer", mode = "n" },
  --  { "<leader>gs", gs.stage_hunk, desc = "stage hunk", mode = "n" },
  --  { "<leader>gS", gs.stage_buffer, desc = "stage buffer", mode = "n" },
  --  { "<leader>gt", gs.toggle_current_line_blame, desc = "toggle line blame", mode = "n" },
  --  { "<leader>gT", gs.toggle_deleted, desc = "toggle deleted", mode = "n" },
  --  { "<leader>gu", gs.undo_stage_hunk, desc = "undo stage hunk", mode = "n" },
  --  {
  --    "<leader>gr",
  --    function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
  --    desc = "reset selected",
  --    mode = "v",
  --  },
  --  {
  --    "<leader>gs",
  --    function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
  --    desc = "stage selected",
  --    mode = "v",
  --  },
  --},
}
