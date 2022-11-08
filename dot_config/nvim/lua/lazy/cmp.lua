-- nvim-cmp / lspkind-nvim
local border_config = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	scrollbar = "┃",
}

local cmp = require("cmp")

if not cmp then
	return
end

cmp.setup({
	window = {
		completion = border_config,
		documentation = border_config,
	},

	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<Down>"] = cmp.mapping.close(),
		["<Up>"] = cmp.mapping.close(),

		["<C-n>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			{ "i" }
		),
		["<C-p>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			{ "i" }
		),

		["<C-f>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
	},

	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "path" },

		{ name = "nvim_lua" },

		{ name = "calc" },
		{ name = "emoji" },
		{ name = "spell", keyword_length = 4 },
		-- { name = 'look', keyword_length = 4,   } ,
		-- { name = "buffer", keyword_length = 4 },
		{ name = "rg", dup = 0 },
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = {
		format = function(entry, vim_item)
			-- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
			vim_item = require("lspkind").cmp_format()(entry, vim_item)

			local alias = {
				buffer = "buffer",
				path = "path",
				nvim_lsp = "LSP",
				luasnip = "LuaSnip",
				nvim_lua = "Lua",
				nvim_lsp_signature_help = "LSP Signature",
				vim_dadbod_completion = "SQL",
			}

			if entry.source.name == "nvim_lsp" then
				vim_item.menu = entry.source.source.client.name
			elseif entry.source.name == "vim-dadbod-completion" then
				vim_item.menu = "db"
			else
				vim_item.menu = alias[entry.source.name] or entry.source.name
			end
			return vim_item
		end,
	},

	-- view = {
	-- 	entries = "native",
	-- },

	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({}),
	sources = {
		{ name = "cmdline" },
		{ name = "cmdline_history" },
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline({}),
	sources = {
		{ name = "buffer" },
	},
})
