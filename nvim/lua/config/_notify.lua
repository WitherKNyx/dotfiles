require('notify').setup({
	fps = 60,
	icons = {
		DEBUG = ' ',
		ERROR = ' ',
		INFO = ' ',
		TRACE = '✎ ',
		WARN = ' '
	},
	timeout = 3000
})
vim.notify = require('notify')
