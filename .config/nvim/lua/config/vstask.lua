require("vstask").setup({
    cache_json_conf = false,
    config_dir = ".debug",
    telescope_keys = {
        current = "<cr>",
    },
    term_opts = {
        current = { direction = "vertical" },
    },
})

local function list_tasks()
    require("telescope").extensions.vstask.tasks(require("telescope.themes").get_ivy())
end

vim.keymap.set("n", "<leader>v", list_tasks)
