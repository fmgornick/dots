vim.api.nvim_create_augroup("Markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "Markdown",
	pattern = "*",
	callback = function()
		local type = vim.api.nvim_buf_get_option(0, "filetype")
		if type == "markdown" then
			require("which-key").register({
				m = { ":MarkdownPreview<cr>", "md preview" },
			}, { prefix = "<leader>" })
		end
	end,
})
