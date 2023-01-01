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
-- cargo-culted from folke
local warn = function(msg, name)
	vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

local error = function(msg, name)
	vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

local info = function(msg, name)
	vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

local toggle = function(option, silent)
	local global_info = vim.api.nvim_get_option_info(option)
	local scopes = { buf = "bo", win = "wo", global = "o" }
	local scope = scopes[global_info.scope]
	local options = vim[scope]
	options[option] = not options[option]
	if silent ~= true then
		if options[option] then
			info("enabled vim." .. scope .. "." .. option, "Toggle")
		else
			warn("disabled vim." .. scope .. "." .. option, "Toggle")
		end
	end
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
	notify = {
		error = error,
		info = info,
		warn = warn,
	},
	ruby = {
		toggle_focus = ruby_toggle_focus,
	},
	subshell = subshell,
	toggle = toggle,
}
