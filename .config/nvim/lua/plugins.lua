vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  -- dependencies
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-tree/nvim-web-devicons" })

  -- lsp stuff
  use({ "neovim/nvim-lspconfig" })
  use({ "folke/neodev.nvim" })

  -- debugging
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })

  -- formatting and linting
  use({ "stevearc/conform.nvim" })

  -- code completion
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "rafamadriz/friendly-snippets" })

  -- fuzzy finder + extension(s)
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- git integration
  use({ "lewis6991/gitsigns.nvim" })
  use({ "kdheepak/lazygit.nvim" })

  -- colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "folke/tokyonight.nvim", as = "tokyonight" })
  use({ "marko-cerovac/material.nvim" })
  use({ "Mofiqul/dracula.nvim" })
  use({ "morhetz/gruvbox" })
  use({ "nyoom-engineering/oxocarbon.nvim" })
  use({ "sainnhe/edge" })
  use({ "sainnhe/everforest" })

  -- OTHER PLUGINS --
  -- stylua: ignore start
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"              }) -- syntax highlighting
  use({ "nvim-lualine/lualine.nvim"                                       }) -- pretty statusline (with colorscheme)
  use({ "folke/trouble.nvim", run = "TroubleToggle"                       }) -- workspace diagnostics
  use({ "goolord/alpha-nvim"                                              }) -- cute little nvim dashboard
  use({ "windwp/nvim-autopairs"                                           }) -- why tf is this not default
  use({ "numToStr/Comment.nvim"                                           }) -- this too oml
  use({ "ThePrimeagen/harpoon"                                            }) -- need that creamy coconut oil
  use({ "phaazon/hop.nvim", as = "hop", branch = "v2"                     }) -- who uses default 's' key anyway
  use({ "lervag/vimtex"                                                   }) -- compiles latex files
  use({ "iamcco/markdown-preview.nvim", run = vim.fn["mkdp#util#install"] }) -- markdown viewer
  use({ "folke/which-key.nvim"                                            }) -- shortcut cheatsheet
  use({ "SmiteshP/nvim-navic"                                             }) -- shows current code context
  use({ "EthanJWright/vs-tasks.nvim"                                      }) -- automated building tool
  -- stylua: ignore end
end)
