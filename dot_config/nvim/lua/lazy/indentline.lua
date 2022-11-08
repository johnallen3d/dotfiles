-- left aligned pipe, looks better with context
-- https://www.reddit.com/r/neovim/comments/w500vi/comment/ih9x4u4/
local char = "▎"

require("indent_blankline").setup({
	char = char,
	context_char = char,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
