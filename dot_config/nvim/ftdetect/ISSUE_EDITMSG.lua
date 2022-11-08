vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = "*ISSUE_EDITMSG",
		command = "set filetype=markdown",
	}
)

