local lsp = require("lsp-zero").preset()
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "gopls",
        "kotlin_language_server",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "texlab",
        "tsserver",
        "yamlls",
    },
    automatic_installation = false,
})

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

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lspconfig.bashls.setup({ filetypes = { "bash", "sh", "zsh" } })
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.yamlls.setup({
    settings = {
        yaml = {
            keyOrdering = false,
        },
    },
})

lsp.setup()

vim.keymap.set("n", "ga", vim.diagnostic.setloclist)
vim.keymap.set("n", "gA", ":TroubleToggle<cr>")
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "gn", vim.diagnostic.goto_next)
