local dap = require("dap")
local dapui = require("dapui")

require("mason-nvim-dap").setup({
	ensure_installed = {
		"codelldb",
		"js-debug-adapter",
	},
	automatic_installation = false,
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "RedSign", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "BlueSign", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "YellowSign", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "GreenSign", linehl = "", numhl = "" })

local function executable_path()
	return vim.fn.input({
		prompt = "executable path: ",
		default = vim.fn.getcwd() .. "/",
		completion = "file",
	})
end

local function rust_executable_path()
	return vim.fn.input({
		prompt = "RUST executable path: ",
		default = vim.fn.getcwd() .. "/",
		completion = "file",
	})
end

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/lldb-vscode",
		args = { "--port", "${port}" },
	},
}

dap.configurations.c = {
	{
		name = "launch",
		type = "codelldb",
		request = "launch",
		program = executable_path,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		externalConsole = false,
		args = {},
	},
}
dap.configurations.cpp = vim.deepcopy(dap.configurations.c)

dap.configurations.rust = {
	{
		name = "launch",
		type = "codelldb",
		request = "launch",
		program = rust_executable_path,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		externalConsole = false,
		args = {},
		initCommands = function()
			local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

			local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
			local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

			local commands = {}
			local file = io.open(commands_file, "r")
			if file then
				for line in file:lines() do
					table.insert(commands, line)
				end
				file:close()
			end
			table.insert(commands, 1, script_import)

			return commands
		end,
		-- ...,
	},
}

dapui.setup({
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.34,
				},
				{
					id = "breakpoints",
					size = 0.33,
				},
				{
					id = "stacks",
					size = 0.33,
				},
			},
			position = "right",
			size = 40,
		},
		{
			elements = {
				{
					id = "repl",
					size = 1.0,
				},
			},
			position = "bottom",
			size = 20,
		},
	},
})

local function conditional_breakpoint()
	dap.set_breakpoint(vim.fn.input("breakpoint condition: "))
end

local function log_message()
	dap.set_breakpoint(nil, nil, vim.fn.input("log message: "))
end

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", conditional_breakpoint)
vim.keymap.set("n", "<leader>de", dapui.eval)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>dO", dap.step_out)
vim.keymap.set("n", "<Leader>dl", dap.run_last)
vim.keymap.set("n", "<leader>dL", log_message)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dR", dap.restart)
vim.keymap.set("n", "<leader>du", dapui.toggle)

vim.keymap.set("n", "<F1>", dap.step_into)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_out)
vim.keymap.set("n", "<F4>", dap.continue)
