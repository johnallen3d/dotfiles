vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = "Dangerfile",
		command = "set filetype=ruby",
	}
)

