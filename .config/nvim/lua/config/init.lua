require("nvim-autopairs").setup()
require("neodev").setup()
require("Comment").setup()
require("hop").setup()
require("harpoon").setup()
-- require("cellular-automaton").register_animation({
--   fps = 50,
--   name = "slide",
-- })

require("config.alpha")
require("config.colors")
require("config.gitsigns")
require("config.lualine")
require("config.telescope")
require("config.treesitter")
require("config.trouble")
require("config.vimtex")
require("config.vstask")
require("config.which-key")

require("config.lsp.servers")
require("config.lsp.cmp")
require("config.lsp.formatters")
require("config.lsp.debuggers")
require("config.lsp.snippets")
