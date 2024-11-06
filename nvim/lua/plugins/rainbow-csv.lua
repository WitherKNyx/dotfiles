return {{
	'cameron-wags/rainbow_csv.nvim',
	config = true,
	init = function()
		vim.cmd [[
		let g:rcsv_colorpairs = [['red', 'red'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['darkblue', 'darkblue'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan'] ]
	]]
	end,
	ft = {
		'csv',
		'tsv'
	},
	cmd = {
		'RainbowDelim',
		'RainbowDelimSimple',
		'RainbowDelimQuoted',
		'RainbowMultiDelim'
	}
}}
