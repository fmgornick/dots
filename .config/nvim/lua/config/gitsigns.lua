require("gitsigns").setup({
  signs = {
    add = { text = "│", hl = "GreenSign" },
    change = { text = "│", hl = "YellowSign" },
    delete = { text = "_", hl = "RedSign" },
    untracked = { text = "┆", hl = "BlueSign" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("v", "<leader>gr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    -- text object
    map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")

    require("which-key").register({
      g = {
        name = "git",
        b = {
          function()
            gs.blame_line({ full = true })
          end,
          "blame line",
        },
        d = { gs.diffthis, "get diff" },
        g = { ":LazyGit<cr>", "lazy git" },
        p = { gs.preview_hunk, "preview hunk" },
        r = { gs.reset_hunk, "reset hunk" },
        R = { gs.reset_buffer, "reset buffer" },
        s = { gs.stage_hunk, "stage hunk" },
        S = { gs.stage_buffer, "stage buffer" },
        t = { gs.toggle_current_line_blame, "toggle line blame" },
        T = { gs.toggle_deleted, "toggle deleted" },
        u = { gs.undo_stage_hunk, "undo stage hunk" },
      },
    }, { prefix = "<leader>" })

    require("which-key").register({
      g = {
        name = "git",
        r = {
          function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          "reset selected",
        },
        s = {
          function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          "stage selected",
        },
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
})
