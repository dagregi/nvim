local M = {}
M._keys = nil
function M.setup()
	local cmp = require("cmp")
	M._keys = M._keys
		or {
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-g>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
			["<C-e>"] = { i = cmp.mapping.abort(), c = cmp.mapping.close() },
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
		}
	return M._keys
end
return M
