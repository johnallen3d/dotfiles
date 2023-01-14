return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local noice = require("noice")
		local navic = require("nvim-navic")

		require("lualine").setup({
			options = {
				refresh = { statusline = 500 },
				icons_enabled = true,
				-- theme = 'auto',
				-- theme = "catppuccin",
				theme = "onedark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					winbar = {
						"help",
						"startify",
						"dashboard",
						"packer",
						"neogitstatus",
						"NvimTree",
						"Trouble",
						"alpha",
						"lir",
						"Outline",
						"spectre_panel",
						"toggleterm",
					},
				},
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
				lualine_b = {
					{
						"filename",
						path = 1,
					},
				},
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
			winbar = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = { { navic.get_location, cond = navic.is_available } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
