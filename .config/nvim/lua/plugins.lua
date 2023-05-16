vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use 'goolord/alpha-nvim'

    use { 
        'nvim-treesitter/nvim-treesitter',
        run = "TSUpdate",
    }

    use {
        "folke/trouble.nvim",
        run = "TroubleToggle",
    }

    use { 
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = 'nvim-lua/plenary.nvim',
	}

	use { 
		'folke/tokyonight.nvim', 
		as = 'tokyonight',
        config = function()
            require('tokyonight').setup({ style = 'moon' })
            vim.cmd.colorscheme('tokyonight')
        end,
	}

    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                sort_by = 'case_sensitive',
                view = { 
                    side = 'left',
                    width = 30,
                },
                renderer = { group_empty = true },
                filters = { dotfiles = true },
            })
        end,
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline').setup() end,
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end,
    }

    use {
        'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end,
    }
end
)
