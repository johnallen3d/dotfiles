return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
				},

				-- panel = { enabled = false },
				-- suggestion = { enabled = false },
				-- copilot_node_command = "/usr/local/bin/node",
			})
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		-- event = "VeryLazy",
		cmd = "ChatGPT",
		lazy = true,
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "op item get ChatGPT --fields label=secret-key",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
