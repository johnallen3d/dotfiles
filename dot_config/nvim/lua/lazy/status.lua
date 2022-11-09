local noice = require("noice")

noice.setup({
	cmdline = {
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	routes = {
		-- prevent notification when writing a file
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
		-- notify when starting to record a macro
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
		-- prevent huge null-ls message when not in a git repo
		{
			filter = {
				event = "notify",
				min_height = 15,
			},
			view = "split",
		},
	},
})

require("lualine").setup({
	options = {
		refresh = { statusline = 500 },
		icons_enabled = true,
		-- theme = 'auto',
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode" },
			{
				noice.api.statusline.mode.get,
				cond = noice.api.statusline.mode.has,
			},
		},
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				noice.api.statusline.command.get,
				cond = noice.api.statusline.command.has,
			},
			{
				noice.api.statusline.search.get,
				cond = noice.api.statusline.search.has,
			},
		},
		lualine_z = { "location" },
	},
})
