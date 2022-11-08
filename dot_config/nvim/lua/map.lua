-- Mappings
local command = vim.api.nvim_create_user_command
local map = require("util").map

-- Leader
vim.g["mapleader"] = ","

-- visual mode blockwise indentation
-- map("v", ">", ">gv")
-- map("v", "<", "<gv")

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
map("n", "<leader>s", "<Plug>(dirvish_split_up)")
map("n", "<leader>v", "<Plug>(dirvish_vsplit_up)")
-- map("n", "<leader>s", ":Sexplore<CR>")
-- map("n", "<leader>v", ":Vexplore!<CR>")

-- quickly hide search highlighting
map("n", "<ESC>", "<cmd>nohlsearch<CR><ESC>")

-- move up/down work on wrapped lines of text
map("n", "j", "gj")
map("n", "k", "gk")

-- use the dot command on visual selections
map("v", ".", "<cmd>norm.<CR>")

-- Ctrl+A to "select all" in current buffer
map("n", "<C-A>", "ggVG")

-- correct last typo
map("n", "<leader>z", "mz[s1z=e`z")

-- rename file in current buffer
map("n", "<leader>n", "", {
	callback = function()
		require("util").file.rename()
	end,
})

-- toggle `:focus` (RSpec)
map("n", "<leader>ff", "", {
	callback = function()
		require("util").ruby.toggle_focus()
	end,
})

--
-- COMMANDS
--
command("GitHub", function()
	require("util").github.browse_line()
end, {})
command("PackerRefresh", function()
	require("util").packer.sync()
end, {})
command("Prettier", "execute '%!jq .'", {})
