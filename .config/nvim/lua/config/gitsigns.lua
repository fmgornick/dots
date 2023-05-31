require("gitsigns").setup({
	signs = {
		add = { text = "│", hl = "GreenSign" },
		change = { text = "│", hl = "YellowSign" },
		delete = { text = "_", hl = "RedSign" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆", hl = "BlueSign" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>gs", gs.stage_hunk)
		map("n", "<leader>gr", gs.reset_hunk)
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>gS", gs.stage_buffer)
		map("n", "<leader>gR", gs.reset_buffer)
		map("n", "<leader>gu", gs.undo_stage_hunk)
		map("n", "<leader>gp", gs.preview_hunk)
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>gt", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.diffthis)
		-- map("n", "<leader>gD", function()
		-- 	gs.diffthis("~")
		-- end)
		map("n", "<leader>gT", gs.toggle_deleted)

		-- text object
		map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")

		-- lazygit
		map("n", "<leader>gg", ":LazyGit<cr>")

		require("which-key").register({
			g = {
				name = "git",
				b = "blame line",
				d = "get diff",
				g = "lazy git",
				p = "preview hunk",
				r = "reset hunk",
				R = "reset buffer",
				s = "stage hunk",
				S = "stage buffer",
				t = "toggle line blame",
				T = "toggle deleted",
				u = "undo stage hunk",
			},
		}, { prefix = "<leader>" })
	end,
})
