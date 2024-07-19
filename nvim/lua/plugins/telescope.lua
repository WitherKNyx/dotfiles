return {{
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim', build = false },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = false },
		{ 'benfowler/telescope-luasnip.nvim', build = false }
	},
	cmd = { 'Telescope' },
	init = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<space>ff', builtin.fd, {})
		vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<space>fb', builtin.buffers, {})
		vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<space>fd', builtin.diagnostics, {})
		vim.keymap.set('n', '<space>fk', builtin.keymaps, {})
	end,
	config = function()
		pcall(require('telescope').load_extension, 'fzf')
		require('telescope').load_extension('luasnip')
	end
}}
