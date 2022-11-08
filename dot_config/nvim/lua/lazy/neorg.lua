require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.export"] = {
			config = {},
		},
		["core.export.markdown"] = {
			config = {
				extensions = "all",
			},
		},
	},
})
