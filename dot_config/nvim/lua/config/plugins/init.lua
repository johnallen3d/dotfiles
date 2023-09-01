return {
	-- common dependencies
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "rcarriga/nvim-notify", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },

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
	-- { "andrewferrier/wrapping.nvim", config = true },
	-- { "github/copilot.vim" },

	-- lsp
	{ "onsails/lspkind-nvim", lazy = true },
	{ "jose-elias-alvarez/typescript.nvim", ft = "typescript" },
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- syntax/lint
	{ "mechatroner/rainbow_csv", ft = "csv" },
	{
		"jjo/vim-cue",
		ft = "cue",
		config = function()
			vim.cmd("let g:cue_fmt_on_save = 0")
		end,
	},
	{ "neoclide/jsonc.vim", ft = "jsonc" },
	{ "ray-x/go.nvim", ft = "go" },
	{ "simrat39/rust-tools.nvim", ft = "rust" },
}
