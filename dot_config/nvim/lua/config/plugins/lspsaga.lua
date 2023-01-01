return {
	"glepnir/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")

		saga.init_lsp_saga({
			border_style = "single",
			move_in_saga = {
				prev = "<C-p>",
				next = "<C-n>",
			},
			-- Error,Warn,Info,Hint
			diagnostic_header = { " ", " ", " ", "ﴞ " },
			-- code action title icon
			code_action_icon = "💡",
			-- if true can press number to execute the codeaction in codeaction window
			code_action_num_shortcut = true,
			code_action_lightbulb = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			-- finder_separator = '  ',
			max_preview_lines = 10,
			finder_action_keys = {
				open = "<CR>",
				vsplit = "s",
				split = "i",
				quit = "<ESC>",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			code_action_keys = {
				quit = "<ESC>",
				exec = "<CR>",
			},
			rename_action_quit = "<C-c>",
			-- winbar must nightly
			symbol_in_winbar = {
				in_custom = false,
				enable = true,
				separator = "  ",
				show_file = true,
				click_support = false,
			},
			server_filetype_map = {},
		})
	end,
}
