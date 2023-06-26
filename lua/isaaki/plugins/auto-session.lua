return {
	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Documents/Code/", "~/Downloads", "/" },
			auto_session_use_git_branch = false,
			auto_session_enable_last_session = false,
		})

		if package.loaded.telescope then
			require("auto-session").setup({
				session_lens = {
					-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
					load_on_setup = true,
					theme_conf = { border = true },
					previewer = false,
				},
			})

			vim.keymap.set("n", "<leader>ou", require("auto-session.session-lens").search_session, {
				noremap = true,
			})
		end
	end,
}
