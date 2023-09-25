-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

--
-- standalone keymaps
--

local default_options = { noremap = true, silent = true }

-- use `-` to access netrw in current directory
vim.api.nvim_set_keymap("n", "-", ':Explore <bar> :sil! /<C-R>=expand("%:t")<CR><CR>', default_options)

-- map p (lower) to P (upper) in visual mode to not stomp on register
vim.api.nvim_set_keymap("v", "p", "P", default_options)
vim.api.nvim_set_keymap("v", "P", "p", default_options)

-- Ctrl+A to "select all" in current buffer
vim.api.nvim_set_keymap("n", "<C-A>", "ggVG", default_options)

---
-- which-key
--
local wk = require("which-key")

vim.o.timeoutlen = 300

wk.setup({
  show_keys = false,
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "," },
})

local leader = {
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
}

wk.register(leader, { prefix = "<leader>" })
