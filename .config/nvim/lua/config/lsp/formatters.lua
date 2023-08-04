local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

require("mason-null-ls").setup({
    ensure_installed = {
        "autopep8",
        "clang_format",
        "gofumpt",
        "latexindent",
        "prettier",
        "shfmt",
        "stylua",
    },
})

null_ls.setup({
    debug = true,

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,

    sources = {
        formatting.autopep8,
        formatting.clang_format.with({
            filetypes = { "c", "cpp" },
            extra_args = {
                string
                    .gsub(
                        [[--style={
                            BasedOnStyle: llvm,
                            ColumnLimit: 100,
                            AllowShortCaseLabelsOnASingleLine: true,
                            AllowShortIfStatementsOnASingleLine: AllIfsAndElse
                        }]],
                        "\n +",
                        " "
                    )
                    :sub(0, -1),
            },
        }),
        formatting.gofumpt,
        formatting.latexindent,
        formatting.prettier.with({
            extra_args = {
                -- "--tab-width=4",
                -- "--bracket-same-line",
            },
        }),
        formatting.rustfmt,
        formatting.shfmt.with({
            filetypes = { "bash", "sh", "zsh" },
        }),
        formatting.stylua.with({
            extra_args = {
                "--quote-style=AutoPreferDouble",
                "--sort-requires",
            },
        }),
        code_actions.gitsigns,
    },
})
