return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		telescope.setup({
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
				preview = false,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				layout_config = {
					anchor = "N",
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				selection_strategy = "reset",
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" },
				file_previewer = require("telescope.previewers").vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("noice")

		-- map(
		-- 	"n",
		-- 	"<c-h>",
		-- 	"<cmd>Telescope help_tags theme=dropdown<CR>",
		-- 	{ silent = true }
		-- )
	end,
}
