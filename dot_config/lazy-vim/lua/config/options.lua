-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- load settings I can't figure out how to set in lua
vim.cmd.source(vim.fn.expand("$HOME/.config/lazy-vim/legacy.vim"))
-- reset leader key provided by lazyvim
vim.g.mapleader = ","
-- hide netrw banner
vim.g.netrw_banner = 0
-- spelling
vim.opt.spellfile = vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add")
-- enable peristent undo
vim.opt.undodir = vim.fn.expand("$HOME/tmp/vim-undo-history")
-- disable swap files
vim.opt.swapfile = false
-- treesitter folding
vim.wo.foldlevel = 99 -- start with all folds open
-- causing freezes - https://github.com/neovim/neovim/issues/24186
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- telescope bug: https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1159637962
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	command = "normal zx",
})
-- show a marker at 80th character
vim.opt.colorcolumn = "81"
-- disable 🐭
vim.opt.mouse = ""
-- hide the number column
vim.opt.number = false
vim.opt.relativenumber = false
-- have :s///g flag by default on
vim.opt.gdefault = true
