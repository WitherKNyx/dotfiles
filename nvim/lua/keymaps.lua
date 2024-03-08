function Map_key(mode, lhs, rhs, dsc, nw)
    nw = nw or false
    dsc = dsc or ""
	if (type(mode) == "table") then
		for _, v in ipairs(mode) do
			vim.api.nvim_set_keymap(v, lhs, rhs, { desc = dsc, nowait = nw, noremap = true, silent = true })
		end
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, { desc = dsc, nowait = nw, noremap = true, silent = true })
	end
end

Map_key({'n', 'v'}, '<C-j>', '<C-e>')
Map_key({'n', 'v'}, '<C-k>', '<C-y>')

Map_key('n', '<CR>', '<Cmd>noh<CR>')

Map_key('n', '<A-j>', ':m +1<CR>==')
Map_key('x', '<A-j>', ':m \'>+1<CR>gv-gv')
Map_key('v', '<A-j>', ':m \'>+1<CR>gv')

Map_key('n', '<A-Down>', ':m +1<CR>==')
Map_key('x', '<A-Down>', ':m \'>+1<CR>gv-gv')
Map_key('v', '<A-Down>', ':m \'>+1<CR>gv')

Map_key('n', '<A-k>', ':m -2<CR>==')
Map_key('x', '<A-k>', ':m \'<-2<CR>gv-gv')
Map_key('v', '<A-k>', ':m \'<-2<CR>gv')

Map_key('n', '<A-Up>', ':m -2<CR>==')
Map_key('x', '<A-k>', ':m \'<-2<CR>gv-gv')
Map_key('v', '<A-k>', ':m \'<-2<CR>gv')
