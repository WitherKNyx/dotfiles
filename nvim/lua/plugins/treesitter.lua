return {{
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	priority = 999,
	lazy = false,
	opts = {
		ensure_installed = { 'norg' },
		highlight = { enable = true }
	},
}}
