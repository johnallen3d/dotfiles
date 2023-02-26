return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
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
			"lua_ls",
			"tsserver",
			"yamlls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = false,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"bash-language-server",
				"black",
				"cbfmt",
				"codespell",
				"commitlint",
				"cueimports",
				"cuelsp",
				"debugpy",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"erg-language-server",
				"eslint-lsp",
				"flake8",
				"gofumpt",
				"goimports",
				"golangci-lint",
				"golines",
				"gopls",
				"hadolint",
				"html-lsp",
				"isort",
				"json-lsp",
				"json-to-struct",
				"lua-language-server",
				"markdownlint",
				"prettier",
				"pyright",
				"revive",
				"rust-analyzer",
				"rustfmt",
				"shellcheck",
				"shfmt",
				"solargraph",
				"sqlfluff",
				"stylua",
				"typescript-language-server",
				"yaml-language-server",
			},

			auto_update = false,
			run_on_start = false,
		})
	end,
}
