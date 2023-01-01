if has('mac')
	" Use Marked for real-time Markdown preview
	" See: https://marked2app.com/
	if executable('/Applications/Marked 2.app/Contents/MacOS/Marked 2')
		autocmd FileType markdown
			\ nnoremap <buffer><Leader>m <cmd>silent !open -a Marked\ 2.app '%:p'<CR>
	endif
endif


" https://github.com/L3MON4D3/LuaSnip#keymaps
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
