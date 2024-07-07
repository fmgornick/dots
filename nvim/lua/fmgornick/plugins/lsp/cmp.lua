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

    local function select_down(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end

    local function select_up(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end

    opts.snippet.expand = function(args) luasnip.lsp_expand(args.body) end
    opts.mapping = cmp.mapping.preset.insert({
      ["<c-space>"] = cmp.mapping.complete(),
      ["<cr>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<tab>"] = cmp.mapping(select_down, { "i", "s" }),
      ["<s-tab>"] = cmp.mapping(select_up, { "i", "s" }),
      ["<c-n>"] = cmp.mapping(select_down, { "i", "s" }),
      ["<c-p>"] = cmp.mapping(select_up, { "i", "s" }),
    })

    cmp.setup(opts)
  end,
}
