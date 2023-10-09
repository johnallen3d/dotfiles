-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local util = require("config.util")

vim.api.nvim_create_autocmd("BufReadPre", {
	group = vim.api.nvim_create_augroup("showtabline", { clear = true }),
	callback = function()
		vim.opt.showtabline = 0
	end,
	desc = "Set tabline to 0",
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
