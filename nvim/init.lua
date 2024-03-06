require('lsp')

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

---- LSP Configs
Plug('neovim/nvim-lspconfig')                                                -- LSP Config
Plug('williamboman/mason.nvim')                                              -- Package Manager
Plug('williamboman/mason-lspconfig.nvim')                                    -- Mason LSP Config Tool
Plug('mfussenegger/nvim-lint')                                               -- Linters
Plug('mhartington/formatter.nvim')                                           -- Formatters
Plug('hrsh7th/nvim-cmp')                                                     -- Autocomplete
Plug('hrsh7th/cmp-nvim-lsp')                                                 -- nvim-cmp using LSP
Plug('hrsh7th/cmp-path')                                                     -- nvim-cmp for path
Plug('hrsh7th/cmp-calc')                                                     -- nvim-cmp for math
Plug('hrsh7th/cmp-nvim-lsp-signature-help')                                  -- nvim-cmp for lsp-signature
Plug('L3MON4D3/LuaSnip', { tag = 'v2.*', ['do'] = 'make install_jsregexp' }) -- Snippets
Plug('saadparwaiz1/cmp_luasnip')                                             -- nvim-cmp for LuaSnip

---- Aesthetic
Plug('dracula/vim')                                      -- Dr. A. Cula
Plug('folke/noice.nvim')								 -- Better menus
Plug('HiPhish/rainbow-delimeters.nvim')					 -- Rainbow Parentheses
Plug('kyazdani42/nvim-web-devicons')                     -- DevIcons
Plug('levouh/tint.nvim')                                 -- Tinting Windows
Plug('lewis6991/gitsigns.nvim')                          -- Git Signs
Plug('lukas-reineke/indent-blankline.nvim')              -- Indent marks
Plug('machakann/vim-highlightedyank')                    -- Highlight Yank region
Plug('MunifTanjim/nui.nvim')                             -- UI Component Library
Plug('norcalli/nvim-colorizer.lua')                      -- Color HL
Plug('nvim-lualine/lualine.nvim')                        -- Statusline
Plug('rcarriga/nvim-notify')							 -- Notifications
Plug('ryanoasis/vim-devicons')                           -- Icons for Plugins
Plug('tanvirtin/monokai.nvim')                           -- Monokai
Plug('WitherKNyx/LovelyNightEighties', { rtp = 'nvim' }) -- My theme :3

---- Extra Functionality
Plug('akinsho/git-conflict.nvim')     -- Git Merge conflicts
Plug('kevinhwang91/nvim-ufo')         -- Better folds
Plug('kevinhwang91/promise-async')    -- Req for ^
Plug('lervag/vimtex')                 -- LaTeX Tools
Plug('numToStr/Comment.nvim')         -- Commenting Binds
Plug('nvim-lua/plenary.nvim')         -- Lua functions
Plug('nvim-neo-tree/neo-tree.nvim')   -- Access file systems
Plug('nvim-telescope/telescope.nvim') -- Access files
Plug('stevearc/aerial.nvim')
Plug('terryma/vim-multiple-cursors')  -- Multiple Cursors, Ctrl + N
Plug('tomiis4/BufferTabs.nvim')       -- Tabs
Plug('tpope/vim-surround')            -- Easy bracket manip
Plug('universal-ctags/ctags')         -- Tagbar Supplement

---- Extra Langs
Plug('benknoble/vim-mips')                              -- MIPS
Plug('mlr-msft/vim-loves-dafny', { ['for'] = 'dafny' }) -- Dafny

---- Misc
Plug('Eandrju/cellular-automaton.nvim') -- Cellular Automata
Plug('wakatime/vim-wakatime')           -- Wakatime


Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] }) -- Syntax highlighter

vim.call('plug#end')

vim.opt.termguicolors = true
require('colorizer').setup()
require('Comment').setup()
require('ibl').setup()

-- Basic Settings
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.mouse = "a"
vim.opt.foldcolumn = "1"
vim.opt.signcolumn = "auto:1-3"

vim.opt.expandtab = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.cindent = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldenable = true

-- vim.g['syntastic_always_populate_loc_list'] = 1
-- vim.g['syntastic_auto_loc_list'] = 1
-- vim.g['syntastic_check_on_open'] = 1
-- vim.g['syntastic_check_on_wq'] = 0

vim.cmd [[
colorscheme lovelynight80s
syntax on
autocmd BufRead,BufNewFile *.s set filetype=mips
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
]]

require 'nvim-treesitter.configs'.setup { highlight = { enable = true } }

local opts = { silent = true }

vim.keymap.set('n', '<CR>', ':noh<CR>', opts)

-- Drag lines
vim.keymap.set('n', '<A-j>', '<Esc>:m .+1<CR>==', opts)
vim.keymap.set('n', '<A-Down>', '<Esc>:m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', '<Esc>:m .-2<CR>==', opts)
vim.keymap.set('n', '<A-Up>', '<Esc>:m .-2<CR>==', opts)
vim.keymap.set('x', '<A-j>', ':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', '<A-Down>', ':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', '<A-k>', ':move \'<-2<CR>gv-gv', opts)
vim.keymap.set('x', '<A-Up>', ':move \'<-2<CR>gv-gv', opts)
vim.keymap.set('v', '<A-j>', ':m\'>+<CR>gv', opts)
vim.keymap.set('v', '<A-Down>', ':m\'>+<CR>gv', opts)
vim.keymap.set('v', '<A-k>', ':m-2<CR>gv', opts)
vim.keymap.set('v', '<A-Up>', ':m-2<CR>gv', opts)

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

--------------------  AerialTab Settings  --------------------
require('aerial').setup({
	on_attach = function(bufnr)
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
	end,
})
vim.keymap.set('n', '<leader><Tab>', '<cmd>AerialToggle!<CR>', {})

--------------------  BufferTab Settings  --------------------
require('buffertabs').setup()
require('buffertabs').toggle()

------------------  Notification Settings  -------------------
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

---------------------  LuaLine Settings  ---------------------
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
		return vim.fn.wordcount().words .. " words"
	end
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
		lualine_x = { 'selectioncount', 'searchcount', 'encoding', 'filetype' },
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

---------------------  Tinting Settings  ---------------------
require("tint").setup()

---------------------  LuaSnip Settings  ---------------------
require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
vim.cmd [[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
vim.api.nvim_set_keymap('i', "<C-t>", '<cmd>lua _G.Dynamic_node_external_update(1)<Cr>', { noremap = true })
vim.api.nvim_set_keymap('s', "<C-t>", '<cmd>lua _G.Dynamic_node_external_update(1)<Cr>', { noremap = true })

vim.api.nvim_set_keymap('i', "<C-g>", '<cmd>lua _G.Dynamic_node_external_update(2)<Cr>', { noremap = true })
vim.api.nvim_set_keymap('s', "<C-g>", '<cmd>lua _G.Dynamic_node_external_update(2)<Cr>', { noremap = true })

------------------  Rainbow Parens Settings  -----------------
local rainbow_delimiters = require('rainbow-delimiters')
vim.g.rainbow_delimiters = {
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		vim = rainbow_delimiters.strategy['local']
	},
	query = {
		[''] = 'rainbow-delimiters',
		lua = 'rainbow-blocks'
	},
	priority = {
		[''] = 110,
		lua = 210
	},
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterOrange',
		'RainbowDelimiterYellow',
		'RainbowDelimiterGreen',
		'RainbowDelimiterCyan',
		'RainbowDelimiterBlue',
		'RainbowDelimiterViolet'
	}
}

--------------------- Telescope Settings ---------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

--------------------- LSP/misc. Settings ---------------------
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts2 = { buffer = event.buf }

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts2)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts2)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts2)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts2)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts2)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts2)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts2)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts2)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts2)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts2)
	end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
	require('lspconfig')[server].setup({
		capabilities = lsp_capabilities,
	})
end

require('mason').setup({})
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	handlers = {
		default_setup,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = { 'vim', 'lsp_servers', 'ls' },
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							}
						}
					}
				}
			})
		end
	},
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'calc' }
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-Space>'] = cmp.mapping.complete(),
	}, {
		{ name = 'buffer' },
	})
})

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (' 󰁂 %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, 'MoreMsg' })
	return newVirtText
end

require('ufo').setup({
	fold_virt_text_handler = handler,
	-- provider_selector = function(_, _, _)
	-- return {'treesitter', 'indent'}
	-- end
})

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
	callback = function()
		vim.fn.jobstart('!notify-send "hello"', { detach = true })
	end,
})

----------------------  Noice Settings  ----------------------
require('noice').setup({
})

-----------------------  Extra Luasnip stuff -----------------------

local current_nsid = vim.api.nvim_create_namespace("LuaSnipChoiceListSelections")
local current_win = nil

local function window_for_choiceNode(choiceNode)
	local buf = vim.api.nvim_create_buf(false, true)
	local buf_text = {}
	local row_selection = 0
	local row_offset = 0
	local text
	for _, node in ipairs(choiceNode.choices) do
		text = node:get_docstring()
		-- find one that is currently showing
		if node == choiceNode.active_choice then
			-- current line is starter from buffer list which is length usually
			row_selection = #buf_text
			-- finding how many lines total within a choice selection
			row_offset = #text
		end
		vim.list_extend(buf_text, text)
	end

	vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
	local w, h = vim.lsp.util._make_floating_popup_size(buf_text)

	-- adding highlight so we can see which one is been selected.
	local extmark = vim.api.nvim_buf_set_extmark(buf, current_nsid, row_selection, 0,
		{ hl_group = 'incsearch', end_line = row_selection + row_offset })

	-- shows window at a beginning of choiceNode.
	local win = vim.api.nvim_open_win(buf, false, {
		relative = "win",
		width = w,
		height = h,
		bufpos = choiceNode.mark:pos_begin_end(),
		style = "minimal",
		border =
		'rounded'
	})

	-- return with 3 main important so we can use them again
	return { win_id = win, extmark = extmark, buf = buf }
end

function Choice_popup(choiceNode)
	-- build stack for nested choiceNodes.
	if current_win then
		vim.api.nvim_win_close(current_win.win_id, true)
		vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	end
	local create_win = window_for_choiceNode(choiceNode)
	current_win = {
		win_id = create_win.win_id,
		prev = current_win,
		node = choiceNode,
		extmark = create_win.extmark,
		buf = create_win.buf
	}
end

function Update_choice_popup(choiceNode)
	if not current_win then return end
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	local create_win = window_for_choiceNode(choiceNode)
	current_win.win_id = create_win.win_id
	current_win.extmark = create_win.extmark
	current_win.buf = create_win.buf
end

function Choice_popup_close()
	if not current_win then return end
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	-- now we are checking if we still have previous choice we were in after exit nested choice
	current_win = current_win.prev
	if current_win then
		-- reopen window further down in the stack.
		local create_win = window_for_choiceNode(current_win.node)
		current_win.win_id = create_win.win_id
		current_win.extmark = create_win.extmark
		current_win.buf = create_win.buf
	end
end

vim.cmd([[
augroup choice_popup
au!
au User LuasnipChoiceNodeEnter lua Choice_popup(require("luasnip").session.event_node)
au User LuasnipChoiceNodeLeave lua Choice_popup_close()
au User LuasnipChangeChoice lua Update_choice_popup(require("luasnip").session.event_node)
augroup END
]])

local ls = require("luasnip")
local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function find_dynamic_node(node)
	-- the dynamicNode-key is set on snippets generated by a dynamicNode only (its'
	-- actual use is to refer to the dynamicNode that generated the snippet).
	while not node.dynamicNode do
		node = node.parent
	end
	return node.dynamicNode
end

local external_update_id = 0
-- func_indx to update the dynamicNode with different functions.
function dynamic_node_external_update(func_indx)
	-- most of this function is about restoring the cursor to the correct
	-- position+mode, the important part are the few lines from
	-- `dynamic_node.snip:store()`.


	-- find current node and the innermost dynamicNode it is inside.
	local current_node = ls.session.current_nodes[vim.api.nvim_get_current_buf()]
	local dynamic_node = find_dynamic_node(current_node)

	-- to identify current node in new snippet, if it is available.
	external_update_id = external_update_id + 1
	current_node.external_update_id = external_update_id
	local current_node_key = current_node.key

	-- store which mode we're in to restore later.
	local insert_pre_call = vim.fn.mode() == "i"
	-- is byte-indexed! Doesn't matter here, but important to be aware of.
	local cursor_pos_end_relative = util.pos_sub(
		util.get_cursor_0ind(),
		current_node.mark:get_endpoint(1)
	)

	-- leave current generated snippet.
	node_util.leave_nodes_between(dynamic_node.snip, current_node)

	-- call update-function.
	local func = dynamic_node.user_args[func_indx]
	if func then
		-- the same snippet passed to the dynamicNode-function. Any output from func
		-- should be stored in it under some unused key.
		func(dynamic_node.parent.snippet)
	end

	-- last_args is used to store the last args that were used to generate the
	-- snippet. If this function is called, these will most probably not have
	-- changed, so they are set to nil, which will force an update.
	dynamic_node.last_args = nil
	dynamic_node:update()

	-- everything below here isn't strictly necessary, but it's pretty nice to have.


    -- try to find the node we marked earlier, or a node with the same key.
    -- Both are getting equal priority here, it might make sense to give "exact
    -- same node" higher priority by doing two searches (but that would require
    -- two searches :( )
	local target_node = dynamic_node:find_node(function(test_node)
		return (test_node.external_update_id == external_update_id) or (current_node_key ~= nil and test_node.key == current_node_key)
	end)

	if target_node then
		-- the node that the cursor was in when changeChoice was called exists
		-- in the active choice! Enter it and all nodes between it and this choiceNode,
		-- then set the cursor.
		node_util.enter_nodes_between(dynamic_node, target_node)

		if insert_pre_call then
			-- restore cursor-position if the node, or a corresponding node,
			-- could be found.
			-- It is restored relative to the end of the node (as opposed to the
			-- beginning). This does not matter if the text in the node is
			-- unchanged, but if the length changed, we may move the cursor
			-- relative to its immediate neighboring characters.
			-- I assume that it is more likely that the text before the cursor
			-- got longer (since it is very likely that the cursor is just at
			-- the end of the node), and thus restoring relative to the
			-- beginning would shift the cursor back.
			-- 
			-- However, restoring to any fixed endpoint is likely to not be
			-- perfect, an interesting enhancement would be to compare the new
			-- and old text/[neighborhood of the cursor], and find its new position
			-- based on that.
			util.set_cursor_0ind(
				util.pos_add(
					target_node.mark:get_endpoint(1),
					cursor_pos_end_relative
				)
			)
		else
			node_util.select_node(target_node)
		end
		-- set the new current node correctly.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = target_node
	else
		-- the marked node wasn't found, just jump into the new snippet noremally.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = dynamic_node.snip:jump_into(1)
	end
end
