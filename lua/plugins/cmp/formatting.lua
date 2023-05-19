local icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

local M = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		local kind = require("lspkind").cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			symbol_map = icons,
		})(entry, vim_item)
		local strings = vim.split(kind.kind, "%s", { trimempty = true })
		kind.kind = " " .. (strings[1] or "") .. " "
		kind.menu = "    " .. (strings[2] or "") .. ""
		return kind
	end,
}

return M
