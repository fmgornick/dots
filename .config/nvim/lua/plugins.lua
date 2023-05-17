vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
    -- dependencies
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }

    -- fuzzy finder + extensions
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'ahmedkhalf/project.nvim', as = 'projects' }

    -- syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }

    -- colorscheme
    use { 'folke/tokyonight.nvim', as = 'tokyonight' }

    -- pretty statusline (with colorscheme)
    use { 'nvim-lualine/lualine.nvim' }

    -- netrw be damned
    use { 'nvim-tree/nvim-tree.lua' }

    -- for showing workspace diagnostics
    use { 'folke/trouble.nvim', run = 'TroubleToggle' }

    -- cute little nvim dashboard
    use { 'goolord/alpha-nvim' }

    -- why tf is this not default
    use { 'windwp/nvim-autopairs' }

    -- this too oml
    use { 'terrortylor/nvim-comment' }

    -- i like the tab look for buffers
    use { 'akinsho/bufferline.nvim', tag = '*' }

    -- i like indentation guides
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- who uses default 's' key anyway
    use { 'phaazon/hop.nvim', as = 'hop', branch = 'v2' }

    -- compiles latex files
    use { 'lervag/vimtex' }

    -- markdown viewer
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }

    -- LSP thingy
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v2.x' }
end)
