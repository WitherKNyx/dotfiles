local rainbow_delimiters = require('rainbow-delimiters')
vim.cmd [[
highlight RainbowDelimiterRed guifg=#ff8c8e
highlight RainbowDelimiterOrange guifg=#ffac80
highlight RainbowDelimiterYellow guifg=#ffea80
highlight RainbowDelimiterGreen guifg=#8ae599
highlight RainbowDelimiterCyan guifg=#73e5e5
highlight RainbowDelimiterBlue guifg=#7399e5
highlight RainbowDelimiterViolet guifg=#e391e5
]]
vim.g.rainbow_delimiters = {
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		vim = rainbow_delimiters.strategy['local']
	},
	query = {
		[''] = 'rainbow-delimiters',
	},
	priority = {
		[''] = 110,
	},
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterOrange',
		'RainbowDelimiterYellow',
		'RainbowDelimiterGreen',
		'RainbowDelimiterCyan',
		'RainbowDelimiterBlue',
		'RainbowDelimiterViolet'
	},
	blacklist = { 's' }
}
