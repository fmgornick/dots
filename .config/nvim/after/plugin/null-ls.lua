local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
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
        formatting.clang_format,
        formatting.latexindent,
        formatting.stylua,
    },
})

mason_null_ls.setup({
    ensure_installed = {
        "autopep8",
        "clang_format",
        "latexindent",
        "stylua",
    },
})
