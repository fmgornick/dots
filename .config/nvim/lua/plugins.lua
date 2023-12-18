return {
  -- shortcuts
  { "folke/which-key.nvim", event = "VeryLazy" },

  -- dependencies
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- lsp stuff
  { "neovim/nvim-lspconfig" },
  { "folke/neodev.nvim" },

  -- debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },

  -- formatting and linting
  { "stevearc/conform.nvim" },

  -- code completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
  { "saadparwaiz1/cmp_luasnip" },

  -- fuzzy finder + extension(s)
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- git integration
  { "lewis6991/gitsigns.nvim" },
  { "kdheepak/lazygit.nvim" },

  -- colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  { "folke/tokyonight.nvim", name = "tokyonight" },
  { "marko-cerovac/material.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "morhetz/gruvbox" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "sainnhe/edge" },
  { "sainnhe/everforest" },

  -- stylua: ignore start
  { "nvim-lualine/lualine.nvim"       }, -- pretty statusline (with colorscheme)
  { "folke/trouble.nvim"              }, -- workspace diagnostics
  { "goolord/alpha-nvim"              }, -- cute little nvim dashboard
  { "windwp/nvim-autopairs"           }, -- why tf is this not default
  { "numToStr/Comment.nvim"           }, -- this too oml
  { "ThePrimeagen/harpoon"            }, -- need that creamy coconut oil
  { "phaazon/hop.nvim", name = "hop"  }, -- who uses default 's' key anyway
  { "lervag/vimtex"                   }, -- compiles latex files
  { "SmiteshP/nvim-navic"             }, -- shows current code context
  { "EthanJWright/vs-tasks.nvim"      }, -- automated building tool
  { "skywind3000/asyncrun.vim"        }, -- for async install repl
  { "eandrju/cellular-automaton.nvim", lazy = false }, -- actually useless
  -- stylua: ignore end
}
