return {{
	'mistricky/codesnap.nvim',
	build = 'make',
	lazy = 'VeryLazy',
	cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapASCII', 'CodeSnapHighlight', 'CodeSnapSaveHighlight' },
	opt = {
		save_path = '~/Pictures/Screenshots/',
		mac_window_bar = true,
		title = 'Codesnap.nvim',
		watermark = '',
		breadcrumbs_separator = '/',
		has_breadcrumbs = true,
		has_line_number = false
	}
}}
