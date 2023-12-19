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
      ["<c-space>"] = cmp.mapping.complete(),
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
    })

    cmp.setup(opts)
  end,
}
