return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local noice = require("noice")

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
	end,
}
