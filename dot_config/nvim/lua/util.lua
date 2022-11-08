local o = vim.o
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

--
-- builtin wrappers
--
local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--
-- general
--
local subshell = function(command, raw)
	local handle = assert(io.popen(command))
	local result = assert(handle:read("*a"))

	handle:close()

	if raw then
		return result
	end

	result = string.gsub(result, "^%s+", "")
	result = string.gsub(result, "%s+$", "")
	result = string.gsub(result, "[\n\r]+", " ")

	return result
end

--
-- file/buffer
--
local trim_trailing_whitespaces = function()
	if not o.binary and o.filetype ~= "diff" then
		local current_view = fn.winsaveview()
		cmd([[keeppatterns %s/\s\+$//e]])
		fn.winrestview(current_view)
	end
end

local current_file_name = function()
	return api.nvim_buf_get_name(0)
end

local rename_file = function()
	local old_name = current_file_name()
	local new_name = vim.fn.input("File: ", old_name)

	if new_name ~= "" and old_name ~= new_name then
		cmd.saveas(new_name)
		os.remove(old_name)
		cmd("redraw!")
	end
end

--
-- colors
--
local colorize = function()
	cmd.packadd("colorizer")
	cmd.ColorizerAttachToBuffer()
end

--
-- packer
--
local packer_compile = function()
	cmd.write()
	os.remove("~/.config/nvim/plugin/packer_compiled.lua")
	cmd.source("~/.config/nvim/lua/plugins.lua")
	cmd.PackerCompile()
end

local packer_sync = function()
	packer_compile()
	cmd.PackerSync()
end

--
-- GitHub
--
local github_browse_line = function()
	local base = subshell("git url")
	local branch = subshell("git rev-parse --abbrev-ref HEAD")
	local file_name = vim.fn.expand("%@")
	local current_line = api.nvim_win_get_cursor(0)[1]
	local url = base
		.. "/blob/"
		.. branch
		.. "/"
		.. file_name
		.. "/#L"
		.. current_line
	local command = "open " .. url

	os.execute(command)
	cmd(":redraw!")
end

--
-- Language Specific
--
local ruby_toggle_focus = function()
	-- Toggle :focus on line (intended for use in specs)
	if string.find(api.nvim_get_current_line(), ":focus") then
		cmd(":s/, :focus/")
	else
		cmd("normal! $bhi, :focus")
	end
end

--
-- Mapping
--
return {
	colorize = colorize,
	file = {
		current = current_file_name,
		rename = rename_file,
		strip = trim_trailing_whitespaces,
		trim_trailing_whitespaces = trim_trailing_whitespaces,
	},
	github = {
		browse_line = github_browse_line,
	},
	map = map,
	packer = {
		compile = packer_compile,
		sync = packer_sync,
	},
	ruby = {
		toggle_focus = ruby_toggle_focus,
	},
	subshell = subshell,
}
