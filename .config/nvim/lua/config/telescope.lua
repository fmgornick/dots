local telescope = require("telescope")

local fb_actions = require("telescope").extensions.file_browser.actions
telescope.setup({
    extensions = {
        file_browser = {
            grouped = true,
            hijack_netrw = true,
            mappings = {
                n = {
                    ["<bs>"] = fb_actions.goto_parent_dir,
                },
            },
            -- theme = "cursor",
            -- theme = "dropdown",
            theme = "ivy",
        },
    },
})

telescope.load_extension("file_browser")
