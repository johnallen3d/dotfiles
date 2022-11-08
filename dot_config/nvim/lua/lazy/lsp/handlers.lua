local M = {}

M.setup = function()
	local win = require("lspconfig.ui.windows")
	local _default_opts = win.default_opts

	win.default_opts = function(options)
		local opts = _default_opts(options)
		opts.border = "single"
		return opts
	end

	local handlers = vim.lsp.handlers
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	local border = {
		{ "╭", "LspFloatWinBorder" },
		{ "─", "LspFloatWinBorder" },
		{ "╮", "LspFloatWinBorder" },
		{ "│", "LspFloatWinBorder" },
		{ "╯", "LspFloatWinBorder" },
		{ "─", "LspFloatWinBorder" },
		{ "╰", "LspFloatWinBorder" },
		{ "│", "LspFloatWinBorder" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(
			sign.name,
			{ texthl = sign.name, text = sign.text, numhl = "" }
		)
	end

	local diagnostic_config = {
		virtual_text = false,
		-- virtual_lines = false,
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = border,
			source = "always",
			prefix = "",
		},
	}

	vim.diagnostic.config(diagnostic_config)

	handlers["textDocument/codeAction"] =
		require("lsputil.codeAction").code_action_handler
	handlers["textDocument/references"] =
		require("lsputil.locations").references_handler
	handlers["textDocument/definition"] =
		require("lsputil.locations").definition_handler
	handlers["textDocument/declaration"] =
		require("lsputil.locations").declaration_handler
	handlers["textDocument/typeDefinition"] =
		require("lsputil.locations").typeDefinition_handler
	handlers["textDocument/implementation"] =
		require("lsputil.locations").implementation_handler
	handlers["textDocument/documentSymbol"] =
		require("lsputil.symbols").document_handler
	handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
	handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config)
end

-- local function lsp_highlight_document(client, bufnr)
-- 	if client.server_capabilities.documentHighlightProvider then
-- 		-- why you no work? 😢
-- 		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
-- 		vim.api.nvim_clear_autocmds({
-- 			buffer = bufnr,
-- 			group = "lsp_document_highlight",
-- 		})
-- 		vim.api.nvim_create_autocmd("CursorHold", {
-- 			callback = vim.lsp.buf.document_highlight,
-- 			buffer = bufnr,
-- 			group = "lsp_document_highlight",
-- 			desc = "Document Highlight",
-- 		})
-- 		vim.api.nvim_create_autocmd("CursorMoved", {
-- 			callback = vim.lsp.buf.clear_references,
-- 			buffer = bufnr,
-- 			group = "lsp_document_highlight",
-- 			desc = "Clear All the References",
-- 		})
-- 	end
-- end

local function lsp_keymaps()
	-- print("Starting" .. vim.inspect(client))
	local opts = { buffer = 0 }
	local map = vim.keymap.set
	local telescope = require("telescope.builtin")

	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
	map("n", "gd", telescope.lsp_definitions, opts)
	-- https://github.com/glepnir/lspsaga.nvim/issues/408
	map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

	-- map("n", "gs", saga_signaturehelp.signature_help, saga_opts)
	-- map("n", "K", vim.lsp.buf.hover, opts)
	-- map("n", "K", saga_hover.render_hover_doc, { silent = true })
	map("n", "gi", telescope.lsp_implementations, opts)
	map("n", "<space>D", vim.lsp.buf.type_definition, opts)
	map("n", "<space>rn", vim.lsp.buf.rename, opts)
	map("n", "<space>ca", vim.lsp.buf.code_action, opts)
	map("n", "gr", telescope.lsp_references, opts)
	map("n", "<space>e", vim.diagnostic.open_float, opts)

	-- map("n", "[g", vim.diagnostic.goto_prev, opts)
	-- map("n", "]g", vim.diagnostic.goto_next, opts)
	map("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
	map("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

	-- map("n", "<space>q", vim.lsp.diagnostic.set_loclist, opts)
	map("n", "<space>f", vim.lsp.buf.format, opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "lua" then
		client.resolved_capabilities.document_formatting = false
	end

	lsp_keymaps()
	-- lsp_highlight_document(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
