return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()

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
	end,
}
