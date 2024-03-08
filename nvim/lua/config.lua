vim.opt.termguicolors = true

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.mouse = "a"
vim.opt.foldcolumn = "1"
vim.opt.signcolumn = "auto:1-3"

vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.cindent = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldenable = true

vim.cmd [[
syntax on
autocmd BufRead,BufNewFile *.s set filetype=mips
]]
