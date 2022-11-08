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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
	group = "OnSave",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		require("go.format").goimport()
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

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "lua/plugins.lua",
	callback = function()
		util.packer.compile()
		vim.notify("Packer has been re-compiled", "info", {
			title = "PackerCompile executed",
		})
	end,
})
