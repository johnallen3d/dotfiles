local notify = require("util").notify

local M = {}

-- vim.lsp.handlers["textDocument/hover"] = function(_, method, result)
--   print(vim.inspect(result))
-- end

M.autoformat = true

--- Toggles global auto-formatting
function M.toggle()
	M.autoformat = not M.autoformat
	if M.autoformat then
		notify.info("enabled format on save", "Formatting")
	else
		notify.warn("disabled format on save", "Formatting")
	end
end

--- Trigger formatting of current buffer
function M.format()
	if M.autoformat then
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		else
			vim.lsp.buf.formatting_sync()
		end
	end
end

function M.setup(client, buf)
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	local nls = require("config.plugins.null-ls")
	local enable = false

	if nls.has_formatter(ft) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	if client.name == "tsserver" then
		enable = false
	end

	client.server_capabilities.documentFormattingProvider = enable

	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				-- vim.lsp.buf.format()
				require("config.plugins.lsp.formatting").format()
			end,
			group = "OnSave",
		})
	end
end

return M
