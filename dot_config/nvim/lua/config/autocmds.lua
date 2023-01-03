local util = require("util")

vim.api.nvim_create_augroup("HighlightYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "HighlightYank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

vim.api.nvim_create_augroup("AutoSave", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	command = ":silent! wall",
	group = "AutoSave",
})

vim.api.nvim_create_augroup("OnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		util.file.trim_trailing_whitespaces()
	end,
	group = "OnSave",
})

-- lsp format on save see: config.plugins.lsp.formatting
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function()
-- 		print("formatting")
-- 		vim.lsp.buf.format()
-- 	end,
-- 	group = "OnSave",
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		require("go.format").goimport()
	end,
	group = "OnSave",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.tsx,*.ts,*.jsx,*.js" },
	callback = function()
		local typescript = require("typescript")

		typescript.actions.organizeImports()
		typescript.actions.removeUnused()
	end,
	group = "OnSave",
})

vim.api.nvim_create_augroup("AutoReload", { clear = true })

vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
	{
		pattern = "*",
		command = "if mode() != 'c' | checktime | endif",
		group = "AutoReload",
	}
)

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		vim.notify("File changed on disk, buffer reloaded.", "info", {
			title = "File Reloaded",
		})
	end,
	group = "AutoReload",
})

vim.api.nvim_create_augroup("ReturnToLastPosition", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	group = "ReturnToLastPosition",
})
