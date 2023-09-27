return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "sql" })
			end
		end,
	},

	{
		"prichrd/netrw.nvim",
		event = "VeryLazy",
		name = "netrw",
		config = true,
	},

	{ "ryvnf/readline.vim", event = "CmdlineEnter" },

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = {
			{ "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
		},
		opts = {
			-- add your options that should be passed to the setup() function here
			position = "right",
		},
	},

	{
		"echasnovski/mini.comment",
		opts = { options = { ignore_blank_line = true } },
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			sections = {
				lualine_z = {},
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local actions = require("telescope.actions")

			return vim.tbl_extend("force", opts, {
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<Down>"] = actions.close,
							["<Up>"] = actions.close,
						},
						n = {
							["<esc>"] = actions.close,
							["<Down>"] = actions.close,
							["<Up>"] = actions.close,
						},
					},
				},
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"dmitmel/cmp-cmdline-history",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
				{ name = "emoji" },
			}))

			-- replicate LazyVim mappings in order to override desired mappings
			-- https://github.com/LazyVim/LazyVim/discussions/1433#discussioncomment-6959614
			opts.mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-p>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-f>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-e>"] = cmp.mapping.abort(),
				["<Down>"] = cmp.mapping.abort(),
				["<Up>"] = cmp.mapping.abort(),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline({
					["<C-f>"] = {
						c = cmp.mapping.confirm({ select = true }),
					},
				}),
				sources = {
					{ name = "cmdline" },
					{ name = "cmdline_history" },
					{ name = "path" },
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline({
					["<C-f>"] = { c = cmp.mapping.confirm({ select = true }) }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},

	{
		"kndndrj/nvim-dbee",
		ft = "sql",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				sources = {
					require("dbee.sources").MemorySource:new({
						{
							id = "duck-in-memory",
							name = "duck-in-memory",
							type = "duck",
							url = "",
						},
					}),
				},
			})
		end,
	},
}
