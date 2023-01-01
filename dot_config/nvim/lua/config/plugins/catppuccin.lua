return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("config.colors").setup("catppuccin")
	end,
}
