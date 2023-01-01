return {
	"woosaaahh/sj.nvim",
	lazy = true,
	config = function()
		local sj = require("sj")

		sj.setup({
			-- automatically jump on a match if it is the only one
			auto_jump = true,
			-- help to better identify labels and matches
			use_overlay = true,

			highlights = {
				-- used for the labels
				SjLabel = { bold = true },
				-- -- used for everything that is not a match
				-- SjOverlay = { bold = true, italic = true },
				-- used to highlight matches
				SjSearch = { bold = true, italic = true },
				-- used in the cmd line when the pattern has no matches
				SjWarning = { bold = true },
			},
		})
	end,
}
