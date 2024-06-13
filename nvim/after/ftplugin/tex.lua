----------------------- Latex Settings -----------------------
vim.g.WordCount = vim.fn['vimtex#misc#wordcount']()
Map_key('i', '<A-i>', '<C-o>$<CR><CR>\\item ')
vim.cmd([[
	augroup word_on_save
		autocmd!
		autocmd BufWritePost <buffer> let g:WordCount = vimtex#misc#wordcount()
	augroup END
]])
