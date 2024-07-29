return {
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		ft = { 'markdown' },
		keys = {
			{ '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = 'Toggle Markdown Preview' }
		},
		build = function()
			vim.fn['mkdp#util#install']()
		end,
	},
	{
		'tadmccorkle/markdown.nvim',
		ft = { 'markdown' },
		opts = {
			on_attach = function(bufnr)
				local map = vim.keymap.set
				local opts = { buffer = bufnr }
				map({ 'n', 'i' }, '<A-l><A-o>', '<cmd>MDListItemBelow<CR>', opts)
				map({ 'n', 'i' }, '<A-L><A-O>', '<cmd>MDListItemAbove<CR>', opts)
				map('n', '<M-c>', '<cmd>MDTaskToggle<CR>', opts)
				map('x', '<M-c>', ':MDTaskToggle<CR>', opts)
			end
		}
	},
	{
		'MeanderingProgrammer/markdown.nvim',
		name = 'render-markdown',
		dependencies = { 
			{ 'nvim-treesitter/nvim-treesitter' }, 
			{ 'nvim-tree/nvim-web-devicons' }
		},
		ft = { 'markdown' },
		opts = {
			code = {
				enabled = true,
				sign = true,
				style = 'full',
				left_pad = 0,
				border = 'thin',
				above = '▄',
				below = '▀',
				highlight = 'NormalFloat',
			},
			checkbox = {
				enabled = true,
				unchecked = {
					icon = '󰄱 ',
					highlight = 'RenderMarkdownUnchecked',
				},
				checked = {
					icon = '󰱒 ',
					highlight = 'RenderMarkdownChecked',
				},
				custom = {
					todo = { 
						raw = '[-]', 
						rendered = '󰥔 ', 
						highlight = 'RenderMarkdownTodo' 
					},
				}
			},
			pipe_table = {
				enabled = true,
				style = 'full',
				cell = 'padded',
				border = {
					'╭', '┬', '╮',
					'├', '┼', '┤',
					'╰', '┴', '╯',
					'│', '─',
				},
				head = 'RenderMarkdownTableHead',
				row = 'RenderMarkdownTableRow',
				filler = 'RenderMarkdownTableFill',
			}
		}
	}
}
