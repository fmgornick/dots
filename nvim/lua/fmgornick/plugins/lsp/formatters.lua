vim.keymap.set("v", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "format region" })

return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = { { "<leader>if", ":ConformInfo<cr>", desc = "formatters (conform)", mode = "n" } },
    opts = {
        formatters_by_ft = {
            bash = { "shfmt" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            css = { "prettierd" },
            go = { "gofmt", "goimports" },
            glsl = { "clang_format" },
            graphql = { "prettierd" },
            haskell = { "fourmolu" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            tex = { "latexindent" },
            lua = { "stylua" },
            markdown = { "prettierd" },
            python = { "ruff_format" },
            sh = { "shfmt" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            yaml = { "prettierd" },
            zsh = { "shfmt" },
            ["_"] = { "trim_whitespace", "trim_newlines" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
        log_level = vim.log.levels.WARN,
        notify_on_error = false,
        formatters = {
            clang_format = {
                command = "clang-format",
                prepend_args = { "--style=InheritParentConfig" },
            },
            latexindent = {
                prepend_args = {
                    "-y=defaultIndent:' '",
                },
            },
            prettierd = {
                prepend_args = {
                    -- "--tab-width=4",
                    -- "--bracket-same-line",
                },
                range_args = function(ctx)
                    return {
                        "--line-start",
                        ctx.range.start[1],
                        "--line-end",
                        ctx.range["end"][1],
                    }
                end,
            },
            shfmt = {
                filetypes = { "bash", "sh", "zsh" },
                prepend_args = { "-i", "2" },
            },
            stylua = {
                prepend_args = {
                    "--collapse-simple-statement=Always",
                    "--indent-type=Spaces",
                    "--quote-style=AutoPreferDouble",
                    "--sort-requires",
                    -- "--indent-width=2",
                },
                range_args = function(ctx)
                    return {
                        "--range-start",
                        ctx.range.start[1],
                        "--range-end",
                        ctx.range["end"][1],
                    }
                end,
            },
        },
    },
}
