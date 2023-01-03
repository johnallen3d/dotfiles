return {
	"folke/noice.nvim",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-notify",
		"MunifTanjim/nui.nvim",
	},
	config = {
		presets = {
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
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
	},
}
