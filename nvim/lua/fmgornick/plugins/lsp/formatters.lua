local keyset = vim.keymap.set
local formatters = {
    clang_format = {
        binary = "clang-format",
        install = "brew install clang-format",
    },
    fourmolu = {
        binary = "fourmolu",
        install = "brew install fourmolu",
    },
    gofumpt = {
        binary = "gofmt",
        install = "brew install gofumpt",
    },
    goimports = {
        binary = "goimports",
        install = "go install golang.org/x/tools/cmd/goimports@latest",
    },
    latexindent = {
        binary = "latexindent",
        install = "brew install latexindent",
    },
    prettierd = {
        binary = "prettierd",
        install = "brew install prettierd",
    },
    ruff = {
        binary = "ruff",
        install = "pipx install ruff",
    },
    shfmt = {
        binary = "shfmt",
        install = "brew install shfmt",
    },
    stylua = {
        binary = "stylua",
        install = "brew install stylua",
    },
}

keyset("n", "<leader>lF", function()
    local all_installed = true
    local install_command = ""

    for _, s in pairs(formatters) do
        if vim.fn.executable(s.binary) ~= 1 then
            all_installed = false
            install_command = install_command .. "echo installing " .. s.binary .. "; "
            install_command = install_command .. s.install .. "; "
            install_command = install_command .. "echo '\\n'; "
        end
    end

    if all_installed then
        print("all formatters already installed!")
    else
        install_command = install_command .. "echo done!!!"
        vim.cmd("vert copen 100")
        vim.cmd("set wrap")
        vim.cmd("AsyncRun -strip " .. install_command)
    end
end, { desc = "install formatters" })

keyset("v", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "format region" })

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
