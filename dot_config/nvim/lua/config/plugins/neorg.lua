-- return {}

-- can't get `:Neorg sync-parsers` to run regardless of c++ version on macOS 12
return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Dropbox/Notes/neorg/",
							programs = "~/Dropbox/Notes/tac/programs/",
							journal = "~/Dropbox/Notes/journal/",
						},
					},
				},
			},
		},
	},
}
