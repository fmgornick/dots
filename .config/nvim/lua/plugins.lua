vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
	-- dependencies
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })

	-- lsp stuff
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "VonHeikemen/lsp-zero.nvim" })
	use({ "folke/neodev.nvim" })

	-- debugging
	use({ "mfussenegger/nvim-dap" })
	use({ "jay-babu/mason-nvim-dap.nvim" })
	use({ "rcarriga/nvim-dap-ui" })

	-- formatting and linting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jay-babu/mason-null-ls.nvim" })

	-- code completion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
	use({ "rafamadriz/friendly-snippets" })

	-- fuzzy finder + extensions
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "ahmedkhalf/project.nvim", as = "projects" })

	-- git integration
	use({ "lewis6991/gitsigns.nvim" })
	use({ "kdheepak/lazygit.nvim" })

	-- colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "morhetz/gruvbox" })
	use({ "folke/tokyonight.nvim", as = "tokyonight" })
	use({ "Mofiqul/dracula.nvim" })
	use({ "nyoom-engineering/oxocarbon.nvim" })
	use({ "sainnhe/edge" })
	use({ "sainnhe/everforest" })

    -- OTHER PLUGINS --
    -- stylua: ignore start
    use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })           -- syntax highlighting
    use({ "nvim-lualine/lualine.nvim" })                                   -- pretty statusline (with colorscheme)
    use({ "folke/trouble.nvim", run = "TroubleToggle" })                   -- workspace diagnostics
    use({ "goolord/alpha-nvim" })                                          -- cute little nvim dashboard
    use({ "windwp/nvim-autopairs" })                                       -- why tf is this not default
    use({ "terrortylor/nvim-comment" })                                    -- this too oml
    use({ "akinsho/bufferline.nvim", tag = "*" })                          -- i like the tab look for buffers
    use({ "phaazon/hop.nvim", as = "hop", branch = "v2" })                 -- who uses default 's' key anyway
    use({ "lervag/vimtex" })                                               -- compiles latex files
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" }) -- markdown viewer
    use({ "folke/which-key.nvim" })                                        -- shortcut cheatsheet
    use({ "SmiteshP/nvim-navic" })                                         -- shows current code context
	-- stylua: ignore end
end)
