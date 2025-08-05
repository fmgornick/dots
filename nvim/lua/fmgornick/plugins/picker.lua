return {
    "ibhagwan/fzf-lua",
    lazy = false,
    config = function()
        local fzf = require("fzf-lua")
        fzf.config_files = function() fzf.files({ cwd = "~/.config" }) end
        fzf.setup({
            "fzf-native",
            fzf_opts = {
                ["--layout"] = "default",
            },
            winopts = {
                border = "none",
                fullscreen = true,
                preview = {
                    hidden = true,
                },
            },
            files = {
                follow = true,
            },
            grep = {
                follow = true,
            },
            git = {
                branches = {
                    cmd = "echo HEAD; git branch --all --format='%(refname:short)'",
                    actions = {
                        ["enter"] = function(selected) require("diffview").open(selected[1]) end,
                    },
                },
            },
        })
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "find files" })
        vim.keymap.set("n", "<leader>fc", fzf.config_files, { desc = "config files" })
        vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, { desc = "grep files" })
        vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "old files" })
        vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "buffers" })
        vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "quickfix list" })
        vim.keymap.set("n", "<leader>fl", fzf.loclist, { desc = "location list" })
        vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "resume search" })
        vim.keymap.set("n", "<leader>gd", fzf.git_branches, { desc = "git diff" })
    end,
}
