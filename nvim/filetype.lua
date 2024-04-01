vim.cmd([[
au! BufRead,BufNewFile *.s set filetype=mips
au! BufRead,BufNewFile *.ua setf uiua
au! BufRead,BufNewFile *. if getline(1) =~ '^#!.*ua$' | setf uiua | endif
]])
