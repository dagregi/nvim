return {
	"stevearc/dressing.nvim",
	init = function()
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
		vim.ui.input = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.input(...)
		end
	end,
	opts = function()
		local function get_hight(self, _, max_lines)
			local results = #self.finder.results
			local PADDING = 5
			local LIMIT = math.floor(max_lines / 2)
			return (results <= (LIMIT - PADDING) and results + PADDING or LIMIT)
		end

		return {
			input = {
				win_options = { winblend = 0 },
			},
			select = {
				telescope = require("telescope.themes").get_dropdown({
					layout_config = { height = get_hight },
				}),
				get_config = function(opts)
					if opts.kind == "codeaction" then
						return {
							backend = "telescope",
							telescope = require("telescope.themes").get_cursor({
								layout_config = { height = get_hight },
							}),
						}
					end
				end,
			},
		}
	end,
	dependencies = { "folke/noice.nvim" },
}
