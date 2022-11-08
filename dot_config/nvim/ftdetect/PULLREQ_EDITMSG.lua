vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = "*PULLREQ_EDITMSG",
		command = "set filetype=markdown",
	}
)

