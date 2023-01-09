-- Options
local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

local opt = function(scope, key, value)
	scopes[scope][key] = value
	if scope ~= "o" then
		scopes["o"][key] = value
	end
end

-- local set = vim.api.nvim_set_option
local cmd = vim.cmd

local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
	"matchparen",
	-- "netrw",
	-- "netrwFileHandlers",
	-- "netrwPlugin",
	-- "netrwSettings",
	"remote_plugins",
	"rrhelper",
	"shada_plugin",
	"tar",
	"tarPlugin",
	"tutor_mode_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- attempt to speed up loading Ruby files
-- https://github.com/neovim/neovim/issues/4930#issuecomment-226903617
-- vim.g.ruby_path = "/usr/local/opt/ruby/bin/ruby"
-- vim.g.loaded_ruby_provider = 0

vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- netrw setup
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "^./$,^../$"
vim.g.netrw_hide = 1

-- filetype detection
cmd.filetype("on") -- detect and load settings for file type
cmd.filetype("plugin on") -- load ftplugin for file type
cmd.filetype("indent on") -- load indentation settings for file type

-- Global
--
local undodir = "/Users/john.allen/tmp/vim-undo-history"

-- always show signcolumns
vim.wo.signcolumn = "yes" -- always show signcolumn

opt("o", "history", 50) -- remember 50 commands
opt("o", "incsearch", true) -- do incremental searching
opt("o", "ignorecase", true) -- searches are case insensitive...
opt("o", "smartcase", true) -- ... unless they contain at least one capital letter
opt("o", "gdefault", true) -- have :s///g flag by default on
opt("o", "smarttab", true) -- inserts indentation according to 'shiftwidth'
opt("o", "backup", false) -- do not make backup before saving
opt("o", "writebackup", false) -- do not write backup before saving
opt("o", "clipboard", "unnamedplus") -- use system clipboard by default!
opt("o", "showmode", false) -- do not show the current mode
opt("o", "pumheight", 25) -- show 10 items in auto-complete
opt("o", "scrolloff", 10) -- keep at least 10 lines visible above/below cursor
opt("o", "termguicolors", true) -- use true (24 bit) colors
opt("o", "hidden", true) -- allow backgrounding buffers without writing them, and remember marks/undo for backgrounded buffers
opt("o", "splitbelow", true) -- new horizontal splits below current
opt("o", "splitright", true) -- new vertical splits right of current
opt("o", "wildoptions", "pum,tagfile") -- complete settings
opt("o", "completeopt", "menuone,noinsert,noselect") -- set completeopt to have a better completion experience
opt("o", "shiftround", true) -- when at 3 spaces and I hit >>, go to 4, not 5
opt("o", "undodir", undodir) -- location to keep undo files
opt("o", "colorcolumn", "81") -- show a marker at 80th character
opt("o", "synmaxcol", 800) -- don't try to highlight long lines
opt("o", "foldenable", false) -- disable folding
opt("o", "updatecount", 0) -- disable swap files
opt("o", "errorbells", false) -- disable error bells
opt("o", "visualbell", false) -- disable error bells
opt("o", "splitkeep", "screen") -- don't jump around on horizontal splits

-- Window
opt("w", "wrap", false) -- do not wrap lines
opt("w", "conceallevel", 0) -- disable conceal

-- Buffer
local indent = 2
opt("b", "tabstop", indent) -- 2 characters as tabs
opt("b", "softtabstop", indent)
opt("b", "shiftwidth", indent) -- use 2 spaces for indentation shortcuts
opt("b", "expandtab", true) -- replace tabs
opt("b", "autoindent", true)
opt("b", "smartindent", true)
opt("b", "swapfile", false) -- do not write swap files
opt("b", "undofile", true) -- persist undo list between sessions
opt("b", "fileencoding", "utf-8")
opt("b", "syntax", "on")
opt("b", "syntax", "enable")

-- Commands
cmd.set("mouse=")
cmd.set("shortmess+=c")
cmd.set("iskeyword+=-")
cmd.set("path+=.,**")
cmd.filetype("plugin on")
-- listchars
cmd.set("list")
cmd.set("listchars+=tab:▸⋅")
cmd.set("listchars+=trail:•")
-- cmd.set("listchars+=nbsp:_')
cmd.set("modifiable")

-- hide ~ character on blank lines
vim.opt.fillchars = "eob: "

-- auto-hide command line
cmd("set cmdheight=0")

-- Status Line
vim.opt.laststatus = 3

-- Abbreviations
local abbrev = vim.cmd.abbrev

abbrev("clog", "<esc>ciwconsole.log();<esc>==$hi")
abbrev("bp", "binding.pry")
abbrev("ipdb", "import ipdb; ipdb.set_trace()")
abbrev("ppry", "import code; code.interact(local=dict(globals(), **locals()))")

-- Spelling
vim.api.nvim_set_option(
	"spellfile",
	vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add")
)
