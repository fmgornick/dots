return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")
        oil.setup({
            cleanup_delay_ms = false,
            default_file_explorer = true,
            prompt_save_on_select_new_entry = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        })
        vim.keymap.set({ "n", "v" }, "<leader>e", oil.open, { desc = "file explorer" })
    end,
}
