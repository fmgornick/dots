return {
    "hrsh7th/nvim-cmp",
    dependencies = "L3MON4D3/LuaSnip",
    lazy = false,
    opts = {
        completion = { completeopt = "menu,menuone,select" },
        experimental = {
            native_menu = false,
            ghost_text = true,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
        },
        snippet = { expand = {} },
    },
    config = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        opts.snippet.expand = function(args) luasnip.lsp_expand(args.body) end
        opts.mapping = cmp.mapping.preset.insert({
            ["<c-b>"] = cmp.mapping.scroll_docs(-4),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-e>"] = cmp.mapping.abort(),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
        })

        cmp.setup(opts)
    end,
}
