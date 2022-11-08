if has('mac')
	" Use Marked for real-time Markdown preview
	" See: https://marked2app.com/
	if executable('/Applications/Marked 2.app/Contents/MacOS/Marked 2')
		autocmd FileType markdown
			\ nnoremap <buffer><Leader>m <cmd>silent !open -a Marked\ 2.app '%:p'<CR>
	endif
endif
