local lspconfig = require("lspconfig")

-- stylua: ignore start
local servers = {
	bashls           = { binary = "bash-language-server",        install = "npm i -g bash-language-server"                                  },
  clangd           = { binary = "clangd",                      install = "brew install llvm"                                              },
  gopls            = { binary = "gopls",                       install = "go install golang.org/x/tools/gopls@latest"                     },
  golangci_lint_ls = { binary = "golangci-lint-langserver",    install = "go install github.com/nametake/golangci-lint-langserver@latest" },
  jsonls           = { binary = "vscode-json-language-server", install = "npm i -g vscode-langservers-extracted"                          },
  lua_ls           = { binary = "lua-language-server",         install = "brew install lua-language-server"                               },
  pyright          = { binary = "pyright-langserver",          install = "brew install pyright"                                           },
  rust_analyzer    = { binary = "rust-analyzer",               install = "rustup component add rust-analyzer"                             },
  tsserver         = { binary = "typescript-language-server",  install = "npm i -g typescript typescript-language-server"                 },
  yamlls           = { binary = "yaml-language-server",        install = "brew install yaml-language-server"                              },
}
-- stylua: ignore end

require("which-key").register({
  l = {
    S = {
      function()
        local all_installed = true
        local install_command = ""

        for _, s in pairs(servers) do
          if vim.fn.executable(s.binary) ~= 1 then
            all_installed = false
            install_command = install_command .. "echo installing " .. s.binary .. "; "
            install_command = install_command .. s.install .. "; "
            install_command = install_command .. "echo '\\n'; "
          end
        end

        if all_installed then
          print("all LSPs already installed!")
        else
          install_command = install_command .. "echo done!!!"
          vim.cmd("vert copen 100")
          vim.cmd("set wrap")
          vim.cmd("AsyncRun -strip " .. install_command)
        end
      end,
      "install language servers",
    },
  },
}, { prefix = "<leader>", mode = "n" })

local signs = {
  Error = "",
  Warn = "",
  Hint = "󰌶",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig.bashls.setup({
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh", "zsh" },
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup({
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        path = runtime_path,
        version = "LuaJIT",
      },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        },
      },
    },
  },
})

lspconfig.gopls.setup({ cmd = { "gopls" } })
lspconfig.golangci_lint_ls.setup({ cmd = { "golangci-lint-langserver" } })
lspconfig.jsonls.setup({ cmd = { "vscode-json-language-server", "--stdio" } })
lspconfig.pyright.setup({ cmd = { "pyright-langserver", "--stdio" } })
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cmd = { "rust-analyzer" },
      completion = {
        callable = {
          snippets = "fill_arguments",
        },
        fullFunctionSignatures = {
          enable = true,
        },
      },
    },
  },
})
lspconfig.tsserver.setup({ cmd = { "typescript-language-server", "--stdio" } })
lspconfig.yamlls.setup({
  cmd = { "yaml-language-server", "--stdio" },
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(env)
    -- enable completion triggered by <c-x><c-o>
    vim.bo[env.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- buffer local mappings
    -- see `:help vim.lsp.*` for documentation on any of the below functions
    require("which-key").register({
      g = {
        a = { vim.diagnostic.setloclist, "loclist diagnostics" },
        d = { vim.lsp.buf.definition, "definition", buffer = env.buf },
        D = { vim.lsp.buf.declaration, "declaration", buffer = env.buf },
        i = { vim.lsp.buf.implementation, "implementation", buffer = env.buf },
        l = { vim.diagnostic.open_float, "float diagnostics" },
        n = { vim.diagnostic.goto_next, "next diagnostic" },
      },
      K = { vim.lsp.buf.hover, "hover", buffer = env.buf },
    }, { prefix = "", mode = "n" })

    require("which-key").register({
      D = { vim.lsp.buf.type_definition, "type definition", buffer = env.buf },
      l = {
        a = { vim.lsp.buf.code_action, "code action" },
        r = { vim.lsp.buf.rename, "rename var" },
      },
      W = {
        a = { vim.lsp.buf.add_workspace_folder, "add workspace folder", buffer = env.buf },
        l = { vim.lsp.buf.list_workspace_folders, "list workspace folders", buffer = env.buf },
        r = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder", buffer = env.buf },
      },
    }, { prefix = "<leader>", mode = "n" })
  end,
})
