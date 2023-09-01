-- return {
-- 	"tpope/vim-dadbod",
-- 	ft = "sql",
-- 	dependencies = {
-- 		"kristijanhusak/vim-dadbod-ui",
-- 		"kristijanhusak/vim-dadbod-completion",
-- 	},
-- }

return {
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
}
