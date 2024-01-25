----------------------- Latex Settings -----------------------
vim.keymap.set('n', '<leader>co', ':w | !rubber --pdf --warn all %<CR>', { buffer = 0 })
vim.keymap.set('n', '<leader>cc', ':!rubber --clean %<CR>', { buffer = 0 })
vim.keymap.set('n', '<leader>v', ':!zathura %:r.pdf &<CR><CR>', { buffer = 0 })
