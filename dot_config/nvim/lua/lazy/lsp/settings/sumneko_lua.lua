local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
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
}
