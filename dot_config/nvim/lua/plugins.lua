local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data")
		.. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use({
			"wbthomason/packer.nvim",
			opt = true,
		})

		-- 😢
		-- https://github.com/neovim/neovim/issues/12587
		-- use({
		-- 	"antoinemadec/FixCursorHold.nvim",
		-- 	config = function()
		-- 		vim.cmd([[let g:cursorhold_updatetime = 100]])
		-- 	end,
		-- })
		use({ "RRethy/vim-illuminate" })
		-- common dependencies
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "rcarriga/nvim-notify" })
		use({ "MunifTanjim/nui.nvim" })

		use({
			"folke/noice.nvim",
			requires = {
				"rcarriga/nvim-notify",
				"MunifTanjim/nui.nvim",
			},
		})

		use({
			"kyazdani42/nvim-web-devicons",
			after = "catppuccin",
			config = function()
				require("lazy.devicons")
			end,
		})
		use({ "stevearc/dressing.nvim" })

		-- os global
		use({
			"subnut/nvim-ghost.nvim",
			run = ":call nvim_ghost#installer#install()",
		})

		-- general
		use({
			"f-person/git-blame.nvim",
			as = "blame",
			opt = true,
		})

		use({
			"kylechui/nvim-surround",
			event = "BufReadPost",
			config = function()
				require("lazy.surround")
			end,
		})

		use({
			"numToStr/Comment.nvim",
			event = "BufReadPost",
			config = function()
				require("Comment").setup({
					ignore = "^$",
				})
			end,
		})

		use({
			"woosaaahh/sj.nvim",
			after = "catppuccin",
			config = function()
				require("lazy.jump")
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			after = "catppuccin",
			config = function()
				require("lazy.indentline")
			end,
		})

		-- use({
		-- 	"nvim-zh/colorful-winsep.nvim",
		-- 	config = function()
		-- 		require("colorful-winsep").setup({})
		-- 	end,
		-- })

		use({
			"smjonas/live-command.nvim",
			config = function()
				require("live-command").setup({
					commands = {
						Norm = { cmd = "normal" },
						Global = { cmd = "global" },
					},
				})
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			after = {
				"catppuccin",
			},
			config = function()
				require("lazy.status")
			end,
		})

		use({ "WhoIsSethDaniel/lualine-lsp-progress.nvim" })

		use({ "ryvnf/readline.vim", event = "CmdlineEnter" })
		use({ "godlygeek/tabular", event = "CmdlineEnter" })

		use({ "justinmk/vim-dirvish" })
		use({ "tpope/vim-vinegar", disable = true })

		use({ "ellisonleao/glow.nvim" })

		use({
			"nvim-neorg/neorg",
			-- tag = "latest",
			ft = "norg",
			after = "nvim-treesitter", -- You may want to specify Telescope here as well
			config = function()
				require("lazy.neorg")
			end,
		})

		-- consider for annotation with go/python
		-- use({ "danymat/neogen" })

		-- Database
		use({
			"tpope/vim-dadbod",
			ft = "sql",
			requires = {
				{
					"kristijanhusak/vim-dadbod-ui",
					ft = "sql",
					after = "nvim-cmp",
				},
				{
					"kristijanhusak/vim-dadbod-completion",
					ft = "sql",
					after = "nvim-cmp",
				},
			},
		})

		-- fuzzy
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("lazy.telescope")
			end,
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			before = "telescope.nvim",
			run = "make",
		})

		-- syntax/lint
		use({ "mechatroner/rainbow_csv", ft = "csv" })
		use({ "jjo/vim-cue", ft = "cue" })
		use({ "neoclide/jsonc.vim", ft = "jsonc" })
		use({ "ray-x/go.nvim" })
		use({
			"RRethy/nvim-treesitter-endwise",
			-- event = "InsertEnter",
			config = function()
				require("nvim-treesitter.configs").setup({
					endwise = {
						enable = true,
					},
				})
			end,
		})
		use({
			"AckslD/nvim-FeMaco.lua",
			config = 'require("femaco").setup()',
		})

		-- snippet
		use({ "L3MON4D3/LuaSnip" })

		-- lsp
		use({
			"williamboman/mason.nvim",
			requires = {
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig",
				{ "jose-elias-alvarez/null-ls.nvim" },
			},
			config = function()
				require("lazy.lsp")
			end,
		})
		use({ "onsails/lspkind-nvim" })
		use({ "RishabhRD/popfix" })
		use({ "RishabhRD/nvim-lsputils" })
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("lazy.lsp.saga")
			end,
		})

		-- -- DAP
		-- use({
		-- 	"mfussenegger/nvim-dap-python",
		-- 	requires = { "mfussenegger/nvim-dap" },
		-- 	config = function()
		-- 		require("lazy.dap")
		-- 	end,
		-- })

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			after = "lspkind-nvim",
			config = function()
				require("lazy.cmp")
			end,
		})

		-- nvim-lspconfig setup is relying on cmp-nvim-lsp, load first
		use({ "hrsh7th/cmp-nvim-lsp", before = "nvim-lspconfig" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
		use({ "dmitmel/cmp-cmdline-history", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
		use({ "f3fora/cmp-spell", after = "nvim-cmp" })
		use({ "lukas-reineke/cmp-rg", after = "nvim-cmp" })
		use({ "kristijanhusak/vim-dadbod-completion", after = "nvim-cmp" })
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

		-- tree-sitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			-- event = "BufReadPost",
			config = function()
				require("lazy.treesitter")
			end,
		})

		-- colors
		use({
			"shaunsingh/nord.nvim",
			disable = true,
		})

		use({
			"folke/tokyonight.nvim",
			disable = true,
			config = function()
				-- require("lazy.colors").setup("tokyonight.nvim")
				require("lazy.colors").setup("tokyonight")
			end,
		})
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			after = "telescope.nvim",
			config = function()
				require("lazy.colors").setup("catppuccin")
			end,
		})

		use({
			"navarasu/onedark.nvim",
			disable = true,
			after = "telescope.nvim",
			config = function()
				require("lazy.colors").setup("onedark")
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua",
			as = "colorizer",
			opt = true,
		})

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,

	profile = {
		enable = false,
		threshold = 10, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
	},

	config = {
		display = {
			keybindings = { -- Keybindings for the display window
				quit = "<ESC>",
			},
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
