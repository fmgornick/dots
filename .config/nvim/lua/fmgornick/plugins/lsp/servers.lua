local server_info = {
  bashls = {
    binary = "bash-language-server",
    install = "npm i -g bash-language-server",
  },
  clangd = {
    binary = "clangd",
    install = "brew install llvm",
  },
  gopls = {
    binary = "gopls",
    install = "go install golang.org/x/tools/gopls@latest",
  },
  golangci_lint_ls = {
    binary = "golangci-lint-langserver",
    install = "go install github.com/nametake/golangci-lint-langserver@latest",
  },
  hls = {
    binary = "haskell-language-server-wrapper",
    install = "brew install haskell-language-server-wrapper",
  },
  jsonls = {
    binary = "vscode-json-language-server",
    install = "npm i -g vscode-langservers-extracted",
  },
  lua_ls = {
    binary = "lua-language-server",
    install = "brew install lua-language-server",
  },
  pyright = {
    binary = "pyright-langserver",
    install = "brew install pyright",
  },
  rust_analyzer = {
    binary = "rust-analyzer",
    install = "rustup component add rust-analyzer",
  },
  tsserver = {
    binary = "typescript-language-server",
    install = "npm i -g typescript typescript-language-server",
  },
  yamlls = {
    binary = "yaml-language-server",
    install = "brew install yaml-language-server",
  },
}

local servers = {
  bashls = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh", "zsh" },
  },
  clangd = {
    cmd = { "clangd" },
  },
  golangci_lint_ls = {
    cmd = { "golangci-lint-langserver" },
    init_options = {
      command = {
        "golangci-lint",
        "run",
        "--out-format",
        "json",
      },
    },
  },
  gopls = {
    cmd = { "gopls" },
    settings = {
      gopls = {
        codelenses = {
          test = true,
          tidy = true,
          vendor = true,
        },
        usePlaceholders = true,
      },
    },
  },
  hls = {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
  },
  lua_ls = {
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
          path = vim.split(package.path, ";"),
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
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
  },
  rust_analyzer = {
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
  },
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
  },
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
}

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

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  keys = { { "<leader>il", ":LspInfo<cr>", desc = "language servers (nvim-lsp)", mode = "n" } },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local keyset = vim.keymap.set

    for name, opts in pairs(servers) do
      if type(opts) == "function" then
        opts()
      else
        local client = lspconfig[name]

        client.setup(vim.tbl_extend("force", {
          flags = { debounce_text_changes = 150 },
          capabilities = capabilities,
        }, opts))
      end
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(env)
        vim.bo[env.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        keyset("n", "ga", vim.diagnostic.setloclist, { desc = "loclist diagnostics" })
        keyset("n", "gd", vim.lsp.buf.definition, { desc = "definition", buffer = env.buf })
        keyset("n", "gD", vim.lsp.buf.declaration, { desc = "declaration", buffer = env.buf })
        keyset("n", "gi", vim.lsp.buf.implementation, { desc = "implementation", buffer = env.buf })
        keyset("n", "gl", vim.diagnostic.open_float, { desc = "float diagnostics" })
        keyset("n", "gn", vim.diagnostic.goto_next, { desc = "next diagnostic" })
        keyset("n", "K", vim.lsp.buf.hover, { desc = "hover", buffer = env.buf })
        keyset("n", "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
        keyset("n", "<leader>lr", vim.lsp.buf.rename, { desc = "rename var" })
        keyset("n", "<leader>lS", function()
          local all_installed = true
          local install_command = ""

          for _, s in pairs(server_info) do
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
        end, { desc = "install language servers" })
      end,
    })
  end,
}
