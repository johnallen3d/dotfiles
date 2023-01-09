return {
	-- common dependencies
	-- "nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"rcarriga/nvim-notify",
	"MunifTanjim/nui.nvim",

	-- ui/ux
	{ "RRethy/vim-illuminate", event = "VeryLazy" },
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
		config = { default = true },
	},
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerAttachToBuffer",
	},
	{ "nvim-zh/colorful-winsep.nvim", event = "VeryLazy", config = true },
	-- productivity
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = { ignore = "^$" },
	},
	{
		"subnut/nvim-ghost.nvim",
		lazy = true, -- Lazy load nvim-ghost.nvim 👇
		run = ":call nvim_ghost#installer#install()",
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = true,
	},
	{
		"prichrd/netrw.nvim",
		event = "VeryLazy",
		name = "netrw",
		config = true,
	},
	{ "ryvnf/readline.vim", event = "CmdlineEnter" },
	{ "godlygeek/tabular", cmd = "Tabularize" },
	{ "folke/which-key.nvim", lazy = true },

	-- lsp
	{ "onsails/lspkind-nvim", lazy = true },
	-- "RishabhRD/popfix",
	-- "RishabhRD/nvim-lsputils",
	{ "jose-elias-alvarez/typescript.nvim", ft = "typescript" },
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- syntax/lint
	{ "mechatroner/rainbow_csv", ft = "csv" },
	{ "jjo/vim-cue", ft = "cue" },
	{ "neoclide/jsonc.vim", ft = "jsonc" },
	{ "ray-x/go.nvim", ft = "go" },
}
