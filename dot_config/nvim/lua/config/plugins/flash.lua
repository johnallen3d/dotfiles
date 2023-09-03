return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		-- {
		-- 	"*",
		-- 	mode = { "n", "x", "o" },
		-- 	function()
		-- 		require("flash").jump({
		-- 			pattern = vim.fn.expand("<cword>"),
		-- 		})
		-- 	end,
		-- 	desc = "Current word",
		-- },
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = {
						forward = true,
						wrap = false,
						multi_window = false,
						mode = function(str)
							return "\\<" .. str
						end,
					},
				})
			end,
			desc = "Flash forward",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = {
						forward = false,
						wrap = false,
						multi_window = false,
						mode = function(str)
							return "\\<" .. str
						end,
					},
				})
			end,
			desc = "Flash back",
		},
		{
			"T",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
	},
}
