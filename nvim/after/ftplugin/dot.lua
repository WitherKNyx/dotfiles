vim.keymap.set('n', '<leader>cd', ':w | !dot -Tpng % > %:r.png<CR>', { buffer = 0 })
vim.keymap.set('n', '<leader>cn', ':w | !neato -Tpng % > %:r.png<CR>', { buffer = 0 })
vim.keymap.set('n', '<leader>cf', ':w | !fdp -Tpng % > %:r.png<CR>', { buffer = 0 })
vim.keymap.set('n', '<leader>v', ':!vimiv %:r.png &<CR><CR>', { buffer = 0 })
