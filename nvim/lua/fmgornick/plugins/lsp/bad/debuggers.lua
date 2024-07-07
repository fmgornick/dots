local dap = require("dap")
local dapui = require("dapui")

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

-- c --
-- make sure llvm installed: brew install llvm
-- > echo $(brew --prefix)/opt/llvm/bin/lldb-vscode | pbcopy

dap.adapters.lldb = {
  type = "executable",
  command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
  name = "lldb",
}

dap.adapters.codelldb = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
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
-------

-- go --
-- make sure delve and vscode-go installed
-- delve: go install github.com/go-delve/delve/cmd/dlv@latest
--      > echo $(go env GOPATH)/bin/dlv | pbcopy
-- vscode-go: git clone https://github.com/golang/vscode-go; cd vscode-go
--            npm install; npm run compile

dap.adapters.go = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
}
dap.configurations.go = {
  {
    type = "go",
    name = "debug",
    request = "launch",
    showLog = false,
    program = "${file}",
    dlvToolPath = "/Users/Z00B3R5/go/bin/dlv",
  },
}
--------

-- javascript --
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { "js-debug-adapter", "${port}" },
  },
}

dap.configurations.javascript = {
  {
    name = "default js-debug",
    type = "pwa-node",
    request = "launch",
    program = executable_path,
    cwd = "${workspaceFolder}",
  },
}
----------------

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
      if string.sub(config.name, 1, 7) == "default" then table.remove(configs, i) end
      if config == launcher then is_new = false end
    end
    if is_new then table.insert(configs, launcher) end
  end
  require("dap").continue()
end

return { debug = debug }
