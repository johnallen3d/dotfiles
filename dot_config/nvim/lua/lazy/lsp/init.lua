require("lazy.lsp.lspconfig")
require("lazy.lsp.null-ls")
require("lazy.lsp.handlers").setup()
require("lazy.lsp.lines")

local capabilities = require("cmp_nvim_lsp").default_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

require("go").setup({
	-- other setups ....
	lsp_cfg = {
		capabilities = capabilities,
		-- other setups
	},
})
