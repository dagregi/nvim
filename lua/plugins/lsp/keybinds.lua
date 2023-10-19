local M = {}

M._keys = nil

function M.setup()
	local cmp, luasnip = require("cmp"), require("luasnip")
	M._keys = M._keys
		or {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s", "c" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s", "c" }),
			["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
			["<C-e>"] = { i = cmp.mapping.abort(), c = cmp.mapping.close() },
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-8), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(8), { "i", "c" }),
			-- ["<C-c>"] = cmp.mapping.complete(),
			["<Down>"] = cmp.mapping(
				cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i", "c" }
			),
			["<Up>"] = cmp.mapping(
				cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i", "c" }
			),
		}
	return M._keys
end

return M
