local config_dir = ".debug"

require("vstask").setup({
    cache_json_conf = false,
    config_dir = config_dir,
    telescope_keys = {
        current = "<cr>",
    },
    term_opts = {
        current = { direction = "vertical" },
    },
})

return {
    list_tasks = function()
        require("telescope").extensions.vstask.tasks(require("telescope.themes").get_ivy())
    end,
    open_tasks = function()
        vim.cmd("edit " .. vim.fn.getcwd() .. "/" .. config_dir .. "/tasks.json")
    end,
    open_launch = function()
        vim.cmd("edit " .. vim.fn.getcwd() .. "/" .. config_dir .. "/launch.json")
    end,
}
