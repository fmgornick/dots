local function next_select() require("diffview.actions").select_next_entry() end
local function prev_select() require("diffview.actions").select_prev_entry() end

return {
    { "tpope/vim-fugitive", lazy = false },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {
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
        },
        keys = {
            { "<leader>gb", ":Gitsigns blame_line<cr>", desc = "blame line", mode = "n" },
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
    },
}
