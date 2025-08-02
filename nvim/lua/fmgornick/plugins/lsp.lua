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
        kotlin_lsp = {},
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

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env) vim.bo[env.buf].omnifunc = "v:lua.vim.lsp.omnifunc" end,
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
        })
    end,
}
