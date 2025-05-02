local servers = {
    bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "bash", "sh", "zsh" },
    },
    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
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
        cmd = { "basedpyright-langserver", "--stdio" },
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
    texlab = {
        settings = {
            texlab = {
                build = {
                    onSave = true,
                },
            },
        },
    },
    ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
    },
    vimls = {
        cmd = { "vim-language-server", "--stdio" },
        filetypes = { "vim" },
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

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    keys = { { "<leader>is", ":LspInfo<cr>", desc = "language servers (nvim-lsp)", mode = "n" } },
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

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = " ",
                    [vim.diagnostic.severity.HINT] = "󰌶",
                },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env)
                vim.bo[env.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                keyset("n", "ga", vim.diagnostic.setloclist, { desc = "loclist diagnostics" })
                keyset("n", "gd", vim.lsp.buf.definition, { desc = "definition", buffer = env.buf })
                keyset("n", "gD", vim.lsp.buf.declaration, { desc = "declaration", buffer = env.buf })
                keyset("n", "gi", vim.lsp.buf.implementation, { desc = "implementation", buffer = env.buf })
                keyset("n", "gr", vim.lsp.buf.references, { desc = "list references", buffer = env.buf })
                keyset("n", "gl", vim.diagnostic.open_float, { desc = "float diagnostics" })
                keyset(
                    "n",
                    "gn",
                    function() vim.diagnostic.jump({ count = 1, float = true }) end,
                    { desc = "next diagnostic" }
                )
                keyset("n", "K", vim.lsp.buf.hover, { desc = "hover", buffer = env.buf })
                keyset("n", "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
                keyset("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "show erors in qf" })
                keyset("n", "<leader>lr", vim.lsp.buf.rename, { desc = "rename var" })
            end,
        })
    end,
}
