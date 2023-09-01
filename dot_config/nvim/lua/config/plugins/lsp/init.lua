return {
	"neovim/nvim-lspconfig",
	config = function()
		require("config.plugins.lsp.diagnostics").setup()
		local runtime_path = vim.split(package.path, ";")

		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")

		local servers = {
			bashls = {},
			-- dagger = {},
			dockerls = {},
			eslint = {},
			jsonls = {},
			html = {},
			pyright = {},
			-- rust_analyzer = {}, -- setup via rust-tools
			solargraph = {},
			lua_ls = {
				settings = {
					Lua = {
						misc = {
							parameters = {
								"--preview",
							},
						},
						runtime = {
							version = "LuaJIT",
							path = runtime_path,
						},
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "tab",
								indent_size = "2",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
							preloadFileSize = 500,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			tsserver = {},
			yamlls = {},
		}

		local function on_attach(client, bufnr)
			require("config.plugins.lsp.formatting").setup(client, bufnr)
			require("config.plugins.lsp.keys").setup(client, bufnr)

			-- attach cmp source whenever copilot attaches
			-- fixes lazy-loading issues with the copilot cmp source
			if client.name == "copilot" then
				require("copilot_cmp")._on_insert_enter()
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local options = {
			on_attach = on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 500,
			},
		}

		for server, opts in pairs(servers) do
			opts = vim.tbl_deep_extend("force", {}, options, opts or {})
			if server == "tsserver" then
				require("typescript").setup({ server = opts })
			else
				require("lspconfig")[server].setup(opts)
			end
		end

		require("config.plugins.null-ls").setup(options)

		require("go").setup({ lsp_cfg = options })

		require("rust-tools").setup({
			server = {
				cmd = {
					-- prefer `rustup component add rust-analyzer` over tea/brew
					--   tea installed version not completing things like `use std`
					-- vim.fn.expand(
					-- 	"$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rust-analyzer"
					-- ),
					-- vim.fn.expand("$HOME/.cargo/bin/rust-analyzer"),
					vim.fn.expand("$HOME/.local/share/nvim/mason/bin/rust-analyzer"),
				},
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = {
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
					},
				},
			},
			tools = {
				inlay_hints = {
					parameter_hints_prefix = " ",
					other_hints_prefix = " ",
					highlight = "Delimiter", -- light_grey vs grey (comment)
				},
			},
		})
	end,
}
