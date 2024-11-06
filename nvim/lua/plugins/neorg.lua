return {{
	'nvim-neorg/neorg',
	dependencies = { 'vhyrro/luarocks.nvim' },
	version = '*',
	ft = 'norg',
	build = ':Neorg sync-parsers',
	opts = {
		load = {
			['core.defaults'] = {},
			['core.concealer'] = {},
			['core.dirman'] = {
				config = {
					workspaces = {
						notes = '~/Documents/Neorg/Notes',
					},
					default_workspace = "notes",
				},
			},
		},
	},
}}
