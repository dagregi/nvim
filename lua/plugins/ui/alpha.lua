return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		local function button(hl, ...)
			local btn = dashboard.button(...)
			local details = select(2, ...)
			local icon = details:match("[^%w%s]+")
			btn.opts.hl = { { hl, 0, #icon + 1 } }
			btn.opts.hl_shortcut = "Title"
			return btn
		end

		dashboard.section.header.val = "Heh"
		dashboard.section.buttons.val = {
			button("Character", "n", "  New file", "<Cmd>ene<Bar>star<CR>"),
			button("Label", "g", "  Find text", "<Cmd>Telescope live_grep_args<CR>"),
			button("Special", "f", "  Find file", "<Cmd>Telescope find_files<CR>"),
			button("Macro", "r", "  Recent files", "<Cmd>Telescope oldfiles<CR>"),
			button("Winbar", "p", "  Recent project", "<Cmd>Telescope projects<CR>"),
			button("Error", "q", "  Quit NVIM", "<Cmd>quitall<CR>"),
		}

		dashboard.section.header.opts.hl = "Title"
		dashboard.section.footer.opts.hl = "Conceal"

		dashboard.config.layout = {
			{ type = "padding", val = 5 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.config)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local v = vim.version() or {}
				local version = string.format(
					"%s Neovim v%d.%d.%d%s",
					" ",
					v.major,
					v.minor,
					v.patch,
					v.prerelease and "(nightly)" or ""
				)

				dashboard.section.footer.val =
					string.format("--- %s loaded %d %s plugins in %d ms ---", version, stats.count, "", ms)
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
