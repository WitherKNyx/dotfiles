local colors = {
	red = '#ff8c8e',
	orange = '#ffac80',
	yellow = '#ffea80',
	green = '#8ae599',
	cyan = '#73e5e5',
	blue = '#7399e5',
	purple = '#ba89e5',
	pink = '#e391e5',
	gui0 = '#120c1f',
	gui1 = '#1e1433',
	gui2 = '#312153',
	gui3 = '#47366b',
	gui4 = '#6574a6',
	gui5 = '#d9d9d9',
}

return {
	normal = {
		a = { bg = colors.gui4, fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui2, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	},
	insert = {
		a = { bg = colors.blue, fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui2, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	},
	visual = {
		a = { bg = colors.pink, fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui2, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	},
	replace = {
		a = { bg = colors.red,  fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui2, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	},
	command = {
		a = { bg = colors.purple, fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui2, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	},
	inactive = {
		a = { bg = colors.gui1, fg = colors.gui0, gui = 'bold' },
		b = { bg = colors.gui1, fg = colors.gui4 },
		c = { bg = colors.gui1, fg = colors.gui4 }
	}
}
