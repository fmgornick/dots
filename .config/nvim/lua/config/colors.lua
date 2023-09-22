-- edge
-- vim.g.edge_style = "aura"
-- vim.g.edge_style = "default"
vim.g.edge_style = "neon"

-- everforest
-- vim.g.everforest_background = "hard"
-- vim.g.everforest_background = "medium"
vim.g.everforest_background = "soft"

-- material
-- vim.g.material_style = "darker"
-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "lighter"
vim.g.material_style = "oceanic"
-- vim.g.material_style = "palenight"

-- dracula
require("dracula").setup({
  -- theme = "dracula",
  theme = "dracula-soft",
})

-- catppuccin
require("catppuccin").setup({
  -- flavour = "frappe",
  -- flavour = "latte",
  flavour = "macchiato",
  -- flavour = "mocha",
})

-- tokyonight
require("tokyonight").setup({
  -- style = "day",
  style = "moon",
  -- style = "night",
  -- style = "storm",
})

vim.cmd.colorscheme("everforest")
