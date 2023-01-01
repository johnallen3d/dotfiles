-- always show winbar, saga has a slight delay in loading
-- which causes the buffer to jump
vim.opt.winbar = " "

require("config.lazy")
require("config.main")
require("config.map")
require("config.autocmds")

vim.cmd.source("~/.config/nvim/legacy.vim")
