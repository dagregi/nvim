return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			--file
			{ "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>fg", "<Cmd>Telescope live_grep_args<CR>", desc = "Find in files (Grep)" },
			{ "<leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Find word" },
			{ "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Recent projects" },
			{ "<leader>fc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy search" },
			{ "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "List buffers" },
			{ "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "List diagnostics" },
			{ "<leader>ft", "<Cmd>Telescope todo-comments todo<CR>", desc = "List todo" },
			{ "<leader>fR", "<Cmd>Telescope resume<CR>", desc = "Resume" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
			-- search
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		},
		opts = function()
			local actions = require("telescope.actions")
			local layout_actions = require("telescope.actions.layout")

			return {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					file_ignore_patterns = {
						"%.jpg",
						"%.jpeg",
						"%.png",
						"%.otf",
						"%.ttf",
						"^.git/",
						"^dist/",
						"^node_modules/",
						"^site-packages/",
						"^__pycache__/",
						"^migrations/",
						".mypy_cache/",
						"package-lock.json",
						"yarn.lock",
						"pnpm-lock.yaml",
					},
					path_display = {
						truncate = 3,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-n>"] = actions.cycle_history_next,
							["<Esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-e>"] = layout_actions.toggle_preview,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd" },
						hidden = true,
					},
					buffers = {
						theme = "dropdown",
						previewer = false,
						sort_mru = true,
						sort_lastused = true,
						ignore_current_buffer = true,
						mappings = {
							i = { ["<C-x>"] = actions.delete_buffer },
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			telescope.load_extension("fzf")
			telescope.load_extension("projects")
			telescope.load_extension("live_grep_args")
		end,
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
}
