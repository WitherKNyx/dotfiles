vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.mouse = 'a'
vim.opt.foldcolumn = '1'
vim.opt.signcolumn = 'auto:1-3'
vim.opt.inccommand = 'split'

vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smartcase = true
vim.opt.cindent = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldenable = true

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.cmd('syntax on')
vim.cmd('filetype plugin on')

vim.cmd([[
	augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 1000 })
	augroup END
]])
