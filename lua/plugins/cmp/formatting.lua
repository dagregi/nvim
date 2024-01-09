local M = {}

local half_win_width = math.floor(vim.api.nvim_win_get_width(0) / 2)
local get_ws = function(max, len)
	return (" "):rep(max - len)
end
function M.format(entry, vim_item)
	local content = vim_item.abbr
	if vim.tbl_contains({ "path" }, entry.source.name) then
		local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
		if icon then
			vim_item.kind = icon
			vim_item.kind_hl_group = hl_group
			if #content > half_win_width then
				vim_item.abbr = vim.fn.strcharpart(content, 0, half_win_width) .. "…"
			else
				vim_item.abbr = content .. get_ws(half_win_width, #content)
			end
			return vim_item
		end
	end

	local kind = require("lspkind").cmp_format({
		mode = "symbol_text",
		-- maxwidth = half_win_width,
		ellipsis_char = "…",
		symbol_map = { Codeium = "󰘦 " },
	})(entry, vim_item)
	return kind
end
return M
