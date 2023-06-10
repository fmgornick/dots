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
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

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

vim.keymap.set("n", "<F1>", dap.step_into)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_out)
vim.keymap.set("n", "<F4>", dap.continue)

local function debug()
    local configs = require("dap").configurations[vim.bo.filetype]
    for _, launcher in pairs(require("vstask.Parse").Launches()) do
        local is_new = true
        for _, config in pairs(configs) do
            if config == launcher then
                is_new = false
            end
        end
        if is_new then
            table.insert(configs, launcher)
        end
    end
    require("dap").continue()
end

return { debug = debug }
