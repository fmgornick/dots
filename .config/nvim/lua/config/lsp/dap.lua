local dap = require("dap")

dap.defaults.fallback.external_terminal = {
	command = "/usr/bin/foot",
	args = { "-Tfloatwindow" },
}

dap.defaults.fallback.force_external_terminal = true

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
}

-- dap.adapters.codelldb = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
-- 		args = { "--port", "${port}" },
-- 	},
-- }

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "RedSign", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "BlueSign", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = " ", texthl = "YellowSign", linehl = "", numhl = "" })

local function program()
	return vim.fn.input({
		prompt = "executable path: ",
		default = vim.fn.getcwd() .. "/",
		completion = "file",
	})
end

dap.configurations.c = {
	{
		name = "cppdbg: launch",
		type = "cppdbg",
		request = "launch",
		program = program,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		args = {},
	},
	-- {
	-- 	name = "cppdbg: attach",
	-- 	type = "cppdbg",
	-- 	request = "Attach",
	-- 	processId = function()
	-- 		return tonumber(vim.fn.input({ prompt = "pid: " }))
	-- 	end,
	-- 	program = program,
	-- 	cwd = "${workspaceFolder}",
	-- 	args = {},
	-- },
}

dap.configurations.cpp = vim.deepcopy(dap.configurations.c)
dap.configurations.rust = vim.deepcopy(dap.configurations.cpp)

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: "))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}

require("dapui").setup({
	-- layouts = {
	-- 	{
	-- 		elements = {
	-- 			"breakpoints",
	-- 			"console",
	-- 			"repl",
	-- 			"stacks",
	-- 			"scopes",
	-- 			"watches",
	-- 		},
	-- 		size = 40,
	-- 		position = "tray",
	-- 	},
	-- },
})

vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<cr>")
vim.keymap.set("n", "<Leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>dO", ":lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<Leader>dr", ":lua require('dap').repl.open()<cr>")
vim.keymap.set("n", "<Leader>dl", ":lua require('dap').run_last()<cr>")
vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<cr>")

vim.keymap.set({ "n", "v" }, "<Leader>dh", ":lua require('dap.ui.widgets').hover()<cr>")
vim.keymap.set({ "n", "v" }, "<Leader>dp", ":lua require('dap.ui.widgets').preview()<cr>")

vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
