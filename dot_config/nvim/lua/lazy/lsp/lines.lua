local status_ok, lsp_lines = pcall(require, "lsp_lines")

if not status_ok then
	return
end

local map = require("util").map

lsp_lines.setup()
-- hide by default
lsp_lines.toggle()

map("", "<space>l", "", {
	silent = true,
	callback = function()
		require("lsp_lines").toggle()
	end,
})
