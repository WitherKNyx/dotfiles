return {{
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim', build = false },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'MunifTanjim/nui.nvim' },
		{ '3rd/image.nvim' }
	},
	lazy = false,
	keys = {
		{ '<leader>e', '<cmd>Neotree filesystem toggle<CR>', { desc = 'Toggle file explorer' } }
	},
	opts = {
		window = {
			mappings = {
				["P"] = { 
					"toggle_preview", 
					config = { use_float = false, use_image_nvim = true } 
				},
			}
		},
		hijack_netrw_behavior = 'open_current',
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}}
