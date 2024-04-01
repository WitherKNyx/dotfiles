vim.g["DOF"] = 'png'

vim.keymap.set('n', '<leader>t1', ':let g:DOF=\'png\'<CR>', { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>t2', ':let g:DOF=\'svg\'<CR>', { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>c1', ':w | !dot -T<C-R>=DOF<CR> % > %:r.<C-R>=DOF<CR><CR>', { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>c2', ':w | !neato -T<C-R>=DOF<CR> % > %:r.<C-R>=DOF<CR><CR>', { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>c3', ':w | !fdp -T<C-R>=DOF<CR> % > %:r.<C-R>=DOF<CR><CR>', { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>v', ':!vimiv %:r.<C-R>=DOF<CR> &<CR><CR>', { silent = true, buffer = 0 })
