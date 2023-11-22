local M = {}

local utils = require("config.utils")

function M.setup()
	-- goto last place
	utils.augroup("LastPlaceLoc", {
		event = "BufReadPost",
		command = function(args)
			local exclude = { "gitcommit" }
			local buf = args.buf
			if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazy_last_loc then
				return
			end
			vim.b[buf].lazy_last_loc = true
			local mark = vim.api.nvim_buf_get_mark(buf, '"')
			local lcount = vim.api.nvim_buf_line_count(buf)
			if mark[1] > 0 and mark[1] <= lcount then
				pcall(vim.api.nvim_win_set_cursor, 0, mark)
			end
		end,
	})

	-- highlight yanks
	utils.augroup("TextYankPost", {
		event = "TextYankPost",
		command = function()
			vim.highlight.on_yank({ timeout = 100 })
		end,
	})
end

return M
