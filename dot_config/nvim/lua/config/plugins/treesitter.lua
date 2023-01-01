return {
	{
		"RRethy/nvim-treesitter-endwise",
		config = function()
			require("nvim-treesitter.configs").setup({
				endwise = {
					enable = true,
				},
			})
		end,
	},
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"comment",
				"dockerfile",
				"fish",
				"go",
				"graphql",
				"help",
				"html",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"markdown",
				"markdown_inline",
				"norg",
				-- "norg_meta",
				-- "norg_table",
				"python",
				"regex",
				"ruby",
				"scala",
				"sql",
				"toml",
				"typescript",
				"vim",
				"yaml",
				-- "java",
				-- "nix",
				-- "r",
				-- "rust",
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "c" }, -- list of language that will be disabled
				use_languagetree = true,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "vv",
					scope_incremental = "vv",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
		})
	end,
}
