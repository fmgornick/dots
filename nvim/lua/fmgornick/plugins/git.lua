return {
    { "tpope/vim-fugitive", lazy = false },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup({
                signs = {
                    add = { text = "┃" },
                    change = { text = "│" },
                    delete = { text = "_", show_count = true },
                    topdelete = { text = "‾", show_count = true },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged = {
                    add = { text = "┃" },
                    change = { text = "│" },
                    delete = { text = "_", show_count = true },
                    topdelete = { text = "‾", show_count = true },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
            })
            vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "blame line" })
            vim.keymap.set({ "n", "v" }, "<leader>gn", gitsigns.next_hunk, { desc = "next hunk" })
            vim.keymap.set({ "n", "v" }, "<leader>gN", gitsigns.prev_hunk, { desc = "previous hunk" })
            vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "preview hunk" })
            vim.keymap.set({ "n", "v" }, "<leader>gr", gitsigns.reset_hunk, { desc = "reset hunk" })
            vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "reset buffer" })
            vim.keymap.set({ "n", "v" }, "<leader>gs", gitsigns.stage_hunk, { desc = "stage hunk" })
            vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "stage buffer" })
            vim.keymap.set("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "toggle line blame" })
            vim.keymap.set("n", "<leader>gT", gitsigns.toggle_deleted, { desc = "toggle deleted" })
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
        config = function()
            local diffview = require("diffview")
            local actions = require("diffview.actions")
            diffview.setup({
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
                        { "n", "j", actions.select_next_entry, { desc = "next file entry + select" } },
                        { "n", "<down>", actions.select_next_entry, { desc = "next file entry + select" } },
                        { "n", "k", actions.select_prev_entry, { desc = "previous file entry + select" } },
                        { "n", "<up>", actions.select_prev_entry, { desc = "previous file entry + select" } },
                        { "n", "q", ":DiffviewClose<cr>", { desc = "close diff view" } },
                    },
                    file_history_panel = {
                        { "n", "j", actions.select_next_entry, { desc = "next file entry + select" } },
                        { "n", "<down>", actions.select_next_entry, { desc = "next file entry + select" } },
                        { "n", "k", actions.select_prev_entry, { desc = "previous file entry + select" } },
                        { "n", "<up>", actions.select_prev_entry, { desc = "previous file entry + select" } },
                        { "n", "q", ":DiffviewClose<cr>", { desc = "close diff view" } },
                    },
                },
            })
        end,
    },
}
