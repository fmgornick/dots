local lsp = require("lsp-zero").preset()
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
luasnip.config.setup()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-d>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-space>"] = cmp.mapping.complete({}),
        ["<cr>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "gopls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "texlab",
        "yamlls",
    },
    automatic_installation = false,
})

vim.keymap.set("n", "<leader>lI", ":Mason<cr>")
vim.keymap.set("n", "<leader>li", ":LspInfo<cr>")
