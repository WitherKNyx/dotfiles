local diff_comp = {
	'diff',
	diff_color = {
		added = { fg = '#8ae599' },
		modified = { fg = '#ffea80' },
		removed = { fg = '#ff8c8e' }
	}
}

local filename_comp = {
	'filename',
	color = function(_)
		return { fg = vim.bo.modified and '#d9d9d9' or '#6574a6' }
	end
}

local function getWords()
	-- the third string here is the string for visual-block mode (^V)
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
		return vim.fn.wordcount().visual_words .. " words"
	else
		if vim.bo.filetype == "tex" then
			return vim.g.WordCount .. " words"
			-- return vim.fn['vimtex#misc#wordcount']() .. " words"
		else
			return vim.fn.wordcount().words .. " words"
		end
	end
end

local function isRecording()
	local reg = vim.fn.reg_recording()
	if reg == "" then return "" end
	return "recording to " .. reg
end

require('lualine').setup()
require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'lovely_night_eighties',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', diff_comp, 'diagnostics' },
		lualine_c = { filename_comp },
		lualine_x = { isRecording, 'selectioncount', 'searchcount', 'encoding', 'filetype' },
		lualine_y = { 'progress', 'location' },
		lualine_z = { getWords }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { filename_comp },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = { 'buffers' },
		lualine_b = { 'branch' },
		lualine_c = { filename_comp },
		lualine_x = {},
		lualine_y = { 'datetime' },
		lualine_z = { 'tabs' }
	},
	winbar = {},
	inactive_winbar = {},
	extensions = { 'aerial', 'fzf', 'man', 'mason', 'neo-tree' }
})
require('lualine').refresh()
