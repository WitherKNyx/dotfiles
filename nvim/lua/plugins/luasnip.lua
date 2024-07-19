return {{
	'L3MON4D3/LuaSnip',
	version = 'v2.*',
	build = 'make install_jsregexp',
	config = function()
		require("luasnip").config.set_config({
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
		})
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
		vim.cmd([[
		" For changing choices in choiceNodes (not strictly necessary for a basic setup).
		imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
		smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
		]])
		vim.api.nvim_set_keymap('i', "<C-t>", '<cmd>lua _G.Dynamic_node_external_update(1)<Cr>', { noremap = true })
		vim.api.nvim_set_keymap('s', "<C-t>", '<cmd>lua _G.Dynamic_node_external_update(1)<Cr>', { noremap = true })

		vim.api.nvim_set_keymap('i', "<C-g>", '<cmd>lua _G.Dynamic_node_external_update(2)<Cr>', { noremap = true })
		vim.api.nvim_set_keymap('s', "<C-g>", '<cmd>lua _G.Dynamic_node_external_update(2)<Cr>', { noremap = true })
	end
}}
