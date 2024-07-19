return {{
	'rcarriga/nvim-notify',
	opts = {
		fps = 60,
		icons = {
			DEBUG = ' ',
			ERROR = ' ',
			INFO = ' ',
			TRACE = '✎ ',
			WARN = ' '
		},
		timeout = 3000
	},
	config = function()
		vim.notify = require('notify')
	end
}}
