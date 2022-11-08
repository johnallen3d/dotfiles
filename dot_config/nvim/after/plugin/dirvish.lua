vim.api.nvim_create_augroup("DirvishSetting", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dirvish",
	command = "silent! unmap <buffer> <C-p>",
	group = "DirvishSetting",
})

vim.g.dirvish_mode = ":sort ,^.*[/],"
