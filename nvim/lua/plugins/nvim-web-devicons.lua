return {{
	'nvim-tree/nvim-web-devicons',
	config = function()
		require('nvim-web-devicons').set_icon({
			ua = {
				icon = '󰕉',
				color = '#E11999',
				cterm_color = '162',
				name = 'uiua'
			}
		})
	end
}}
