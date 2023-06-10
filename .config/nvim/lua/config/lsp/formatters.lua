local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

require("mason-null-ls").setup({
    ensure_installed = {
        "autopep8",
        "clang_format",
        "latexindent",
        "prettier",
        "rustfmt",
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
        formatting.clang_format.with({ extra_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" } }),
        formatting.latexindent,
        formatting.prettier.with({ extra_args = { "--tab-width 4", "--bracket-same-line" } }),
        formatting.rustfmt,
        formatting.shfmt.with({ filetypes = { "bash", "sh", "zsh" } }),
        formatting.stylua,
        code_actions.gitsigns,
    },
})
