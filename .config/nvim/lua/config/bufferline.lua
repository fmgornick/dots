require("bufferline").setup({
	options = {
		custom_filter = function(buf_number, _)
			if not string.find(vim.fn.bufname(buf_number), "^term://") then
				return true
			end
		end,
	},
})
