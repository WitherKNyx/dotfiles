return {
	{
		'WitherKNyx/LovelyNight80sNvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd('colorscheme lovelynight80s')
		end
	},
	{
		"nvim-neorg/neorg",
		ft = "norg",
		opts = {
			load = { ["core.defaults"] = {} },
		},
	},
	{
		'tomiis4/BufferTabs.nvim',
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' }
		},
		lazy = false,
		enabled = false,
		opts = {}
	},
	{ 
		'lukas-reineke/indent-blankline.nvim', 
		main = 'ibl',
		opts = {},
	},
	{ 
		'norcalli/nvim-colorizer.lua',
		main = 'colorizer',
		opts = {},
		config = function()
			vim.cmd('ColorizerAttachToBuffer')
		end
	},
	{ 'mg979/vim-visual-multi', branch = 'master', enabled = false },
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	{ 'akinsho/git-conflict.nvim', version = '*', config = true },
	{ 'numToStr/Comment.nvim', opts = {} },
	{ 'levouh/tint.nvim', opts = {} },
	{ 'lervag/vimtex', lazy = false },
	{ 'wakatime/vim-wakatime', lazy = false },
	{ 'MunifTanjim/nui.nvim' },
	{ 'ryanoasis/vim-devicons' },
	{ 'tpope/vim-surround' },
	{ 'benknoble/vim-mips' },
	{ 'Eandrju/cellular-automaton.nvim' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'tanvirtin/monokai.nvim' },
	{ 'dracula/vim' }
}
