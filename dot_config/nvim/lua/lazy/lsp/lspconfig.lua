require("mason").setup()

-- "golangci-lint-langserver",

local servers = {
	-- Language Servers
	"bashls",
	"dagger",
	"dockerls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"pyright",
	"solargraph",
	"sumneko_lua",
	"tsserver",
	"yamlls",
	-- -- DAP
	-- "debugpy",
	-- -- Formatters
	-- "black",
	-- "cbfmt",
	-- "golines",
	-- "isort",
	-- "prettier",
	-- "rubocop",
	-- "shfmt",
	-- "stylua",
	-- -- Linters
	-- "codespell",
	-- "eslint_d",
	-- "flake8",
	-- "markdownlint",
	-- "shellcheck",
	-- "sqlfluff",
	-- "write-good",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("lazy.lsp.handlers").on_attach,
	capabilities = require("lazy.lsp.handlers").capabilities,
	flags = {
		debounce_text_changes = 500,
	},
}

local sumneko_opts =
	vim.tbl_deep_extend("force", require("lazy.lsp.settings.sumneko_lua"), opts)

-- local gopls_opts =
-- 	vim.tbl_deep_extend("force", require("lazy.lsp.settings.gopls"), opts)

lspconfig.bashls.setup(opts)
lspconfig.dagger.setup(opts)
lspconfig.dockerls.setup(opts)
lspconfig.eslint.setup(opts)
lspconfig.tsserver.setup(opts)
-- lspconfig.golangci_lint_ls.setup(opts)
lspconfig.gopls.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.html.setup(opts)
lspconfig.pyright.setup(opts)
lspconfig.solargraph.setup(opts)
lspconfig.sumneko_lua.setup(sumneko_opts)
lspconfig.yamlls.setup(opts)
