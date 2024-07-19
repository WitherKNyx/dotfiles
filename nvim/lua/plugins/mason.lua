return {{
	'williamboman/mason.nvim',
	dependencies = {
		{ 'mfussenegger/nvim-lint' },
		{ 'mhartington/formatter.nvim' }
	},
	lazy = false,
	opts = {
		ui = { border = 'rounded' }
	}
}}
