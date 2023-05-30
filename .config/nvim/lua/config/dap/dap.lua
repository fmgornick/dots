local dap = require("dap")
local dapui = require("dapui")
local mason_nvim_dap = require("mason-nvim-dap")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>ds", dap.step_into)
vim.keymap.set("n", "<leader>dS", dap.step_over)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dt", dapui.open)

mason_nvim_dap.setup({
	ensure_installed = { "cpptools" },
	handlers = {},
})

require("dap.ext.vscode").load_launchjs(".debug/launch.json")
