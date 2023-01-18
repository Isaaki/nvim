return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
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
				end, { expr = true, desc = "Next hunk [Gitsigns]" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Prev hunk [Gitsigns]" })

				-- Actions
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "Git blame line [Gitsigns]" })
				map("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Git toggle blame line [Gitsigns]" })
				map("n", "<leader>gd", gs.diffthis, { desc = "Git diff [Gitsigns]" })
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, { desc = "Git diff ~ [Gitsigns]" })

				-- map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
				-- map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
				-- map("n", "<leader>hS", gs.stage_buffer)
				-- map("n", "<leader>hu", gs.undo_stage_hunk)
				-- map("n", "<leader>hR", gs.reset_buffer)
				-- map("n", "<leader>hp", gs.preview_hunk)
				-- map("n", "<leader>hb", function()
				-- 	gs.blame_line({ full = true })
				-- end)
				-- map("n", "<leader>tb", gs.toggle_current_line_blame)
				-- map("n", "<leader>hd", gs.diffthis)
				-- map("n", "<leader>hD", function()
				-- 	gs.diffthis("~")
				-- end)
				-- map("n", "<leader>td", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git select hunk [Gitsigns]" })
			end,
		})
	end,
}
