return {
	"numToStr/Comment.nvim",
	event = "ModeChanged",
	opts = function()
		local ok, tcs = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
		return {
			ignore = "^$",
			pre_hook = ok and tcs and tcs.create_pre_hook() or nil,
		}
	end,
}
