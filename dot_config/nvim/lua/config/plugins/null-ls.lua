local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "InsertEnter",
}

M.setup = function(options)
	local nls = require("null-ls")

	-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
	nls.setup({
		debug = false,
		on_attach = options.on_attach,

		-- commented out sources are installed via :Mason
		sources = {
			nls.builtins.formatting.black,
			nls.builtins.formatting.cbfmt.with({
				extra_args = {
					"--config",
					vim.fn.expand("$HOME/.config/cbfmt/cbfmt.toml"),
				},
			}),
			nls.builtins.formatting.codespell.with({
				extra_args = {
					"--ignore-words",
					vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add"),
				},
			}),
			nls.builtins.formatting.cueimports, -- manage imports and formats
			nls.builtins.formatting.golines,
			nls.builtins.formatting.isort,
			nls.builtins.formatting.prettier.with({
				disabled_filetypes = { "markdown" },
			}),
			nls.builtins.formatting.markdownlint.with({
				extra_args = {
					"--config",
					vim.fn.expand("$HOME/.config/markdownlint/config.yaml"),
				},
			}),
			nls.builtins.formatting.shfmt.with({ extra_args = { "indent", "2" } }),
			nls.builtins.formatting.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
				timeout = 10000,
			}),
			nls.builtins.formatting.stylua.with({
				extra_args = { "indent_type", "Tabs" },
			}),
			nls.builtins.formatting.trim_newlines,

			nls.builtins.diagnostics.codespell.with({
				extra_args = {
					"--ignore-words",
					vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add"),
				},
			}),
			nls.builtins.diagnostics.cue_fmt, -- not managed by Mason
			nls.builtins.diagnostics.flake8,
			nls.builtins.diagnostics.hadolint,
			nls.builtins.diagnostics.markdownlint.with({
				extra_args = {
					"--config",
					vim.fn.expand("$HOME/.config/markdownlint/config.yaml"),
				},
			}),
			nls.builtins.diagnostics.rubocop,
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.diagnostics.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
				timeout = 10000,
			}),
			-- nls.builtins.diagnostics.write_good,

			require("typescript.extensions.null-ls.code-actions"),
		},
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
