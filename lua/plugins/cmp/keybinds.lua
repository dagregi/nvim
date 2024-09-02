local M = {}
M._keys = nil
function M.setup()
	local cmp = require("cmp")
	local ls = require("luasnip")
	M._keys = M._keys
		or {
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-g>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-u>"] = cmp.mapping.scroll_docs(-8),
			["<C-d>"] = cmp.mapping.scroll_docs(8),
			["<C-k>"] = function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end,
			["<C-j>"] = function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end,
		}
	return M._keys
end
return M
