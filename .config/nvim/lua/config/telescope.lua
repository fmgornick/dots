local telescope = require("telescope")
local builtin = require("telescope.builtin")

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
telescope.load_extension("projects")

local function file_browser()
	telescope.extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
end

local function find_config_files()
	builtin.find_files({ cwd = "~/.config/nvim" })
end

vim.keymap.set("n", "<leader>e", file_browser)
vim.keymap.set("n", "<leader>fb", file_browser)
vim.keymap.set("n", "<leader>fc", find_config_files)
vim.keymap.set("n", "<leader>fC", builtin.colorscheme)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects)
