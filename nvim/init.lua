vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.options')
require('config.keymaps')
require('config.lsp')
require('config.lazy')
-- Plug('mlr-msft/vim-loves-dafny', { ['for'] = 'dafny' }) -- Dafny

-- require('nvim-treesitter.configs').setup({ ensure_installed = {'c','lua','vim','vimdoc','	query','markdown','markdown_inline'}, highlight = { enable = true } })
require('nvim-treesitter.configs').setup({ highlight = { enable = true } })

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
	callback = function()
		vim.fn.jobstart('!notify-send "hello"', { detach = true })
	end,
})
