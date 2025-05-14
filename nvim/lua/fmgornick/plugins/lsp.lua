return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    lazy = false,
    opts = {
        clangd = {},
        gopls = {
            cmd = { "gopls" },
            settings = {
                gopls = {
                    codelenses = { test = true, tidy = true, vendor = true },
                    usePlaceholders = true,
                },
            },
        },
        hls = {},
        jsonls = {},
        lua_ls = {
            cmd = { "lua-language-server" },
            settings = {
                Lua = {
                    completion = { callSnippet = "Replace" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME .. "/lua", -- nvim auto-complete
                            vim.fn.stdpath("config") .. "/lua", -- my config auto-complete
                            "${3rd}/luv/library", -- lua stdlib
                        },
                    },
                },
            },
        },
        pyright = { cmd = { "basedpyright-langserver", "--stdio" } },
        rust_analyzer = {},
        texlab = { settings = { texlab = { build = { onSave = true } } } },
        yamlls = { settings = { yaml = { keyOrdering = false } } },
    },
    config = function(_, servers)
        for lsp, opts in pairs(servers) do
            vim.lsp.enable(lsp)
            vim.lsp.config(lsp, opts)
        end

        local map = vim.keymap.set
        local utils = require("fmgornick.core.utils")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env)
                vim.bo[env.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                map("n", "ga", vim.diagnostic.setloclist, { desc = "loclist diagnostics" })
                map("n", "gd", vim.lsp.buf.definition, { desc = "definition", buffer = env.buf })
                map("n", "gD", vim.lsp.buf.declaration, { desc = "declaration", buffer = env.buf })
                map("n", "gi", vim.lsp.buf.implementation, { desc = "implementation", buffer = env.buf })
                map("n", "gr", vim.lsp.buf.references, { desc = "list references", buffer = env.buf })
                map("n", "gl", vim.diagnostic.open_float, { desc = "diagnostics in floating window" })
                map("n", "gn", utils.next_diagnostic, { desc = "next diagnostic" })
                map("n", "gN", utils.prev_diagnostic, { desc = "previous diagnostic" })
                map("n", "K", vim.lsp.buf.hover, { desc = "hover function details", buffer = env.buf })
                map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
                map("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "show erors in quickfix list" })
                map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "rename variable" })
            end,
        })

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
    end,
}
