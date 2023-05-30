local zero = require("lsp-zero").preset()

zero.on_attach(function(_, bufnr)
	zero.default_keymaps({ buffer = bufnr })
end)

zero.setup()
