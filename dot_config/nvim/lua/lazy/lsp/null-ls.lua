local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local on_attach = require("lazy.lsp.handlers").on_attach
-- local capabilities = require("lazy.lsp.handlers").capabilities
local cbfmt_settings = require("lazy.lsp.settings.cbfmt")
local codespell_settings = require("lazy.lsp.settings.codespell")
local markdownlint_settings = require("lazy.lsp.settings.markdownlint")
local stylua_settings = require("lazy.lsp.settings.stylua")
local sqlfluff_settings = require("lazy.lsp.settings.sqlfluff")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
	debug = false,
	on_attach = on_attach,

	-- commented out sources are installed via :Mason
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.cbfmt.with(cbfmt_settings),
		null_ls.builtins.formatting.codespell.with(codespell_settings),
		null_ls.builtins.formatting.cue_fmt, -- not managed by Mason
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.prettier.with({
			disabled_filetypes = { "markdown" },
		}),
		null_ls.builtins.formatting.markdownlint.with(markdownlint_settings),
		null_ls.builtins.formatting.shfmt.with({ extra_args = { "indent", "2" } }),
		null_ls.builtins.formatting.sqlfluff.with(sqlfluff_settings),
		null_ls.builtins.formatting.stylua.with(stylua_settings),
		null_ls.builtins.formatting.trim_newlines,

		null_ls.builtins.diagnostics.codespell.with(codespell_settings),
		null_ls.builtins.diagnostics.cue_fmt, -- not managed by Mason
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.diagnostics.markdownlint.with(markdownlint_settings),
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.sqlfluff.with(sqlfluff_settings),
		-- null_ls.builtins.diagnostics.write_good,
	},
})
