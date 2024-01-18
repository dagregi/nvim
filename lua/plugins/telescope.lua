return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		-- files
		{ "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Find in files (Grep)" },
		{ "<leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Find word" },
		{ "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Recent projects" },
		{ "<leader>fc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy search" },
		{ "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "List diagnostics" },
		{ "<leader>fR", "<Cmd>Telescope resume<CR>", desc = "Resume" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
		{ "<leader>gt", "<cmd>Telescope git_status<CR>", desc = "Status" },
	},
	opts = function()
		return {
			defaults = {
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
					"%.lock",
				},
				path_display = {
					truncate = 3,
				},
				mappings = {
					i = {
						["<Esc>"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
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
	end,
	dependencies = {
		"BurntSushi/ripgrep",
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("config.utils").on_load("telescope.nvim", function()
					require("telescope").load_extension("fzf")
				end)
			end,
		},
	},
}
