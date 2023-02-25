return {
	"ggandor/leap.nvim",
	event = "VeryLazy",
	config = function()
		require("leap").add_default_mappings()
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
	end,
}
