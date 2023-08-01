local dap = require("dap")
local dapui = require("dapui")

require("mason-nvim-dap").setup({
    ensure_installed = {
        "codelldb",
        "js",
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
local dap_path = vim.fn.stdpath("data") .. "/mason/bin/"

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/local/opt/llvm/bin/lldb-vscode",
    name = "lldb",
}

dap.adapters.codelldb = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = dap_path .. "codelldb",
        args = { "--port", "${port}" },
    },
}

require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = { dap_path .. "js-debug-adapter", "${port}" },
    },
}

dap.configurations.c = {
    {
        name = "default lldb",
        type = "lldb",
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

require("dap").configurations.javascript = {
    {
        name = "default js-debug",
        type = "pwa-node",
        request = "launch",
        program = executable_path,
        cwd = "${workspaceFolder}",
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

-- use default dap config or add config from launch.json if exists
local function debug()
    local configs = require("dap").configurations[vim.bo.filetype]
    for _, launcher in pairs(require("vstask.Parse").Launches()) do
        local is_new = true
        for i, config in pairs(configs) do
            if string.sub(config.name, 1, 7) == "default" then
                table.remove(configs, i)
            end
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
