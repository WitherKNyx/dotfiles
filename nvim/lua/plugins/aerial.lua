return {{
	'stevearc/aerial.nvim',
	opts = {
		on_attach = function(bufnr)
			vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
			vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
		end
	},
	keys = {
		{ '<leader><Tab>', '<cmd>AerialToggle!<CR>' }
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons'
	}
}}
