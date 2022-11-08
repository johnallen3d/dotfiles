local M = {}

function M:catppuccin()
	require("catppuccin").setup({
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			coc_nvim = false,
			lsp_trouble = false,
			cmp = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = false,
			telescope = true,
			nvimtree = false,
			dap = {
				enabled = false,
				enable_ui = false,
			},
			neotree = {
				enabled = false,
				show_root = true,
				transparent_panel = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			markdown = true,
			lightspeed = false,
			leap = false,
			ts_rainbow = false,
			hop = false,
			notify = true,
			telekasten = false,
			symbols_outline = false,
			mini = false,
			aerial = false,
			vimwiki = false,
			beacon = false,
			navic = {
				enabled = false,
				custom_bg = "NONE",
			},
			overseer = false,
			fidget = true,
			treesitter_context = false,
		},
	})

	vim.g.catppuccin_flavour = "mocha"
	-- vim.g.catppuccin_flavour = "latte"
	vim.cmd.colorscheme("catppuccin")
end

function M:onedark()
	require("onedark").setup({
		style = "deep",
		toggle_style_key = "<nop>",
		highlights = {
			CmpCompletionWindowBorder = { fg = "$blue" },
			LspFloatWinBorder = { fg = "$blue" },
			TelescopeBorder = { fg = "$blue" },
			TelescopePromptBorder = { fg = "$blue" },
			TelescopeResultsBorder = { fg = "$blue" },
			TelescopePreviewBorder = { fg = "$blue" },
			TelescopePromptTitle = { fg = "$bg0", bg = "$green" },
			TelescopeResultsTitle = { fg = "$bg0", bg = "$green" },
		},
	})
	require("onedark").load()
end

function M:tokyonight()
	require("tokyonight.colors").setup({})

	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_italic_functions = true
	vim.g.tokyonight_italic_variables = true
	vim.g.tokyonight_sidebars = { "packer", "qf" }

	vim.g.tokyonight_colors = {
		error = "#ff0000",
	}

	-- vim.g.tokyonight_hide_inactive_statusline = true
	vim.cmd("colorscheme tokyonight")
end

M.setup = function(scheme)
	M[scheme]()
end

return M
