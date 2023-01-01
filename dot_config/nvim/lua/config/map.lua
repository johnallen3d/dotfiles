-- Mappings
local command = vim.api.nvim_create_user_command
local util = require("util")
local map = util.map
local wk = require("which-key")

vim.o.timeoutlen = 300

wk.setup({
	show_keys = false,
	show_help = false,
	triggers = "auto",
	plugins = { spelling = true },
	key_labels = { ["<leader>"] = "," },
})

-- disable Ex mode
map("n", "Q", "<nop>")

-- make ZZ _slightly_ more useful
map("n", "ZZ", ":wqa<CR>")

-- pane navigation
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-H>", "<C-W><C-H>")
map("n", "<C-L>", "<C-W><C-L>")

-- convenient splits
map("n", "-", ':Explore <bar> :sil! /<C-R>=expand("%:t")<CR><CR>')

-- quickly hide search highlighting
map("n", "<ESC>", "<cmd>nohlsearch<CR><ESC>")

-- move up/down work on wrapped lines of text
map("n", "j", "gj")
map("n", "k", "gk")

-- use the dot command on visual selections
map("v", ".", "<cmd>norm.<CR>")

-- map p (lower) to P (upper) in visual mode to not stop on register
map("v", "p", "P")
map("v", "P", "p")

-- Ctrl+A to "select all" in current buffer
map("n", "<C-A>", "ggVG")

--
-- COMMANDS
--
command("GitHub", function()
	require("util").github.browse_line()
end, {})

--
-- Leader Mappings
--
local leader = {
	-- ["s"] = {
	-- 	':Sexplore <bar> :sil! /<C-R>=expand("%:t")<CR><CR>',
	-- 	"split window horizontal",
	-- },
	-- ["v"] = {
	-- 	':Vexplore! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>',
	-- 	"split window vertical",
	-- },
	["f"] = {
		name = "+file",
		f = { "<cmd>Telescope find_files theme=dropdown<CR>", "Find File" },
		r = { "<cmd>Telescope oldfiles theme=dropdown<CR>", "Open Recent File" },
		n = {
			function()
				require("util").file.rename()
			end,
			"Rename curretn file",
		},
	},
	["h"] = {
		name = "+help",
		t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
		c = { "<cmd>:Telescope commands<cr>", "Commands" },
		h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
		m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
		k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
		s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
		l = { vim.show_pos, "Highlight Groups at cursor" },
		f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
		o = { "<cmd>:Telescope vim_options<cr>", "Options" },
		a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
	},
	["s"] = {
		name = "+search",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Buffer" },
		g = { "<cmd>Telescope live_grep theme=dropdown<CR>", "Grep" },
		j = {
			function()
				require("sj").run()
			end,
			"Grep",
		},
		m = { "<cmd>Telescope noice theme=dropdown<CR>", "Messages" },
	},
	["t"] = {
		name = "+toggle",
		f = {
			require("config.plugins.lsp.formatting").toggle,
			"Format on Save",
		},
		r = {
			name = "+ruby",
			-- cond = client.name == "solargraph",
			f = {
				function()
					require("util").ruby.toggle_focus()
				end,
				"toggle `:focus` (RSpec)",
			},
		},
		s = {
			function()
				util.toggle("spell")
			end,
			"Spelling",
		},
		w = {
			function()
				util.toggle("wrap")
			end,
			"Word Wrap",
		},
		n = {
			function()
				util.toggle("relativenumber", true)
				util.toggle("number")
			end,
			"Line Numbers",
		},
	},
	["w"] = {
		name = "+windows",
		["H"] = { "<C-W>5<", "expand-window-left" },
		["J"] = { ":resize +5<CR>", "expand-window-below" },
		["L"] = { "<C-W>5>", "expand-window-right" },
		["K"] = { ":resize -5<CR>", "expand-window-up" },
		["="] = { "<C-W>=", "balance-window" },
		["s"] = {
			':Sexplore <bar> :sil! /<C-R>=expand("%:t")<CR><CR>',
			"split window horizontal",
		},
		["v"] = {
			':Vexplore! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>',
			"split window vertical",
		},
	},
	["z"] = { "mz[s1z=e`z", "correct last typo" },
	["<tab>"] = {
		name = "tabs",
		["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
		n = { "<cmd>tabnext<CR>", "Next" },
		d = { "<cmd>tabclose<CR>", "Close" },
		p = { "<cmd>tabprevious<CR>", "Previous" },
		["]"] = { "<cmd>tabnext<CR>", "Next" },
		["["] = { "<cmd>tabprevious<CR>", "Previous" },
		f = { "<cmd>tabfirst<CR>", "First" },
		l = { "<cmd>tablast<CR>", "Last" },
	},
}

wk.register(leader, { prefix = "<leader>" })
