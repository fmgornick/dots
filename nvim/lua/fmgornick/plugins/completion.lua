return {
    "hrsh7th/nvim-cmp",
    dependencies = "L3MON4D3/LuaSnip",
    lazy = false,
    opts = {
        completion = { completeopt = "menu,menuone,select" },
        experimental = { ghost_text = true },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
        },
    },
    config = function(_, opts)
        local cmp = require("cmp")
        opts.mapping = cmp.mapping.preset.insert({
            ["<c-n>"] = cmp.mapping.select_next_item(),
            ["<c-p>"] = cmp.mapping.select_prev_item(),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-b>"] = cmp.mapping.scroll_docs(-4),
            ["<c-e>"] = cmp.mapping.abort(),
            ["<cr>"] = cmp.mapping.confirm(),
        })
        cmp.setup(opts)
    end,
}
