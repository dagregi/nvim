local M = {}
function M.format(entry, vim_item)
	if vim.tbl_contains({ "path" }, entry.source.name) then
		local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
		if icon then
			vim_item.kind = icon
			vim_item.kind_hl_group = hl_group
			return vim_item
		end
	end
	local half_win_width = math.floor(vim.api.nvim_win_get_width(0) / 2)
	local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = half_win_width })(entry, vim_item)
	return kind
end
return M
