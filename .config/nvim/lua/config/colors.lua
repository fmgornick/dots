local function settheme(cs)
  vim.cmd.colorscheme(cs)
  require("lualine").setup({ options = { theme = cs } })
end

require("catppuccin").setup({
  -- flavour = "frappe",
  -- flavour = "latte",
  flavour = "macchiato",
  -- flavour = "mocha",
})

require("tokyonight").setup({
  -- style = "storm",
  style = "moon",
  -- style = "night",
  -- style = "day",
})

settheme("everforest")
