require('lsp')

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

---- LSP Configs
Plug('neovim/nvim-lspconfig')													-- LSP Config
Plug('williamboman/mason.nvim')													-- Package Manager
Plug('williamboman/mason-lspconfig.nvim')										-- Mason LSP Config Tool
Plug('mfussenegger/nvim-lint')													-- Linters
Plug('mhartington/formatter.nvim')												-- Formatters
Plug('hrsh7th/nvim-cmp')														-- Autocomplete
Plug('hrsh7th/cmp-nvim-lsp')													-- nvim-cmp using LSP
Plug('hrsh7th/cmp-path')														-- nvim-cmp for path
Plug('hrsh7th/cmp-calc')														-- nvim-cmp for math
Plug('hrsh7th/cmp-nvim-lsp-signature-help')										-- nvim-cmp for lsp-signature
Plug('L3MON4D3/LuaSnip', {tag = 'v2.*', ['do'] = 'make install_jsregexp'})		-- Snippets
Plug('saadparwaiz1/cmp_luasnip')												-- nvim-cmp for LuaSnip

---- Aesthetic
Plug('dracula/vim')																-- Dr. A. Cula
Plug('kyazdani42/nvim-web-devicons')											-- DevIcons
Plug('lewis6991/gitsigns.nvim')													-- Git Signs
Plug('lukas-reineke/indent-blankline.nvim')										-- Indent marks
Plug('luochen1990/rainbow')														-- Rainbow Parentheses
Plug('machakann/vim-highlightedyank')											-- Highlight Yank region
Plug('MunifTanjim/nui.nvim')													-- UI Component Library
Plug('norcalli/nvim-colorizer.lua')												-- Color HL
Plug('ryanoasis/vim-devicons')													-- Icons for Plugins
Plug('tanvirtin/monokai.nvim')													-- Monokai
Plug('vim-airline/vim-airline')													-- Status bar :)
Plug('vim-airline/vim-airline-themes')											-- Themes!
Plug('WitherKNyx/LovelyNightEighties', {rtp = 'nvim'})							-- My theme :3

---- Extra Functionality
Plug('akinsho/git-conflict.nvim')												-- Git Merge conflicts
Plug('kevinhwang91/nvim-ufo')													-- Better folds
Plug('kevinhwang91/promise-async')												-- Req for ^
Plug('lervag/vimtex')															-- LaTeX Tools
Plug('numToStr/Comment.nvim')													-- Commenting Binds
Plug('nvim-lua/plenary.nvim')													-- Lua functions
Plug('nvim-neo-tree/neo-tree.nvim')												-- Access file systems
Plug('nvim-telescope/telescope.nvim')											-- Access files
Plug('stevearc/aerial.nvim')
Plug('terryma/vim-multiple-cursors')											-- Multiple Cursors, Ctrl + N
Plug('tomiis4/BufferTabs.nvim')													-- Tabs
-- Plug('tpope/vim-sleuth')                                                        -- Guess tabs and indents
Plug('tpope/vim-surround')														-- Easy bracket manip
Plug('universal-ctags/ctags')													-- Tagbar Supplement

---- Extra Langs
Plug('benknoble/vim-mips')														-- MIPS
Plug('mlr-msft/vim-loves-dafny', {['for'] = 'dafny'})							-- Dafny

---- Misc
Plug('Eandrju/cellular-automaton.nvim')											-- Cellular Automata
Plug('wakatime/vim-wakatime')													-- Wakatime


Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})			-- Syntax highlighter

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

vim.g['syntastic_always_populate_loc_list'] = 1
vim.g['syntastic_auto_loc_list'] = 1
vim.g['syntastic_check_on_open'] = 1
vim.g['syntastic_check_on_wq'] = 0
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'lovely_night_eighties'

vim.cmd [[
colorscheme lovelynight80s
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
autocmd BufRead,BufNewFile *.s set filetype=mips
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>
]]

require'nvim-treesitter.configs'.setup{highlight={enable=true}}

local opts = {silent = true}

vim.keymap.set('n', '<CR>', ':noh<CR>', opts)

-- Drag lines
vim.keymap.set('n', '<A-j>',	'<Esc>:m .+1<CR>==', opts)
vim.keymap.set('n', '<A-Down>', '<Esc>:m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>',	'<Esc>:m .-2<CR>==', opts)
vim.keymap.set('n', '<A-Up>',	'<Esc>:m .-2<CR>==', opts)
vim.keymap.set('x', '<A-j>',	':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', '<A-Down>', ':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', '<A-k>',	':move \'<-2<CR>gv-gv', opts)
vim.keymap.set('x', '<A-Up>',	':move \'<-2<CR>gv-gv', opts)
vim.keymap.set('v', '<A-j>',	':m\'>+<CR>gv', opts)
vim.keymap.set('v', '<A-Down>', ':m\'>+<CR>gv', opts)
vim.keymap.set('v', '<A-k>',	':m-2<CR>gv', opts)
vim.keymap.set('v', '<A-Up>',	':m-2<CR>gv', opts)

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

--------------------  AerialTab Settings  --------------------
require('aerial').setup({
	on_attach = function (bufnr)
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
	end,
})
vim.keymap.set('n', '<leader><Tab>', '<cmd>AerialToggle!<CR>', {})

--------------------  BufferTab Settings  --------------------
require('buffertabs').setup()
require('buffertabs').toggle()

---------------------  LuaSnip Settings  ---------------------
require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip"})
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

------------------  Rainbow Parens Settings  -----------------
vim.g['rainbow_active'] = 1
vim.cmd [[ let g:rainbow_conf = {'guifgs': ['#FF8C8E', '#FFAC80', '#FFEA80', '#8AE599', '#73E5E5', '#7399E5', '#E391E5'], 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'], 'guis': [''], 'cterms': [''], 'operators': '_,_', 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'], 'separately': {'*': {}, 'markdown': {'parentheses_options': 'containedin=markdownCode contained'}, 'lisp': {'guifgs': ['#FF8C8E', '#FFAC80', '#FFEA80', '#8AE599', '#73E5E5', '#7399E5', '#E391E5']}, 'haskell': {'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold']}, 'vim': {'parentheses_options': 'containedin=vimFuncBody'}, 'perl': {'syn_name_prefix': 'perlBlockFoldRainbow'}, 'stylus': {'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup']}, 'css': 0}}]]
--
-- Keymaps
-- n = normal
-- i = insert
-- v = visual and select
-- s = select
-- x = visual
-- o = operator-pending
-- ! = insert and command-line
-- c = command-line
-- t = terminal
--

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
		local opts2 = {buffer = event.buf}

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

		vim.keymap.set('n',	'K',	'<cmd>lua vim.lsp.buf.hover()<cr>', opts2)
		vim.keymap.set('n',	'gd',	'<cmd>lua vim.lsp.buf.definition()<cr>', opts2)
		vim.keymap.set('n',	'gD',	'<cmd>lua vim.lsp.buf.declaration()<cr>', opts2)
		vim.keymap.set('n',	'gi',	'<cmd>lua vim.lsp.buf.implementation()<cr>', opts2)
		vim.keymap.set('n',	'go',	'<cmd>lua vim.lsp.buf.type_definition()<cr>', opts2)
		vim.keymap.set('n',	'gr',	'<cmd>lua vim.lsp.buf.references()<cr>', opts2)
		vim.keymap.set('n',	'gs',	'<cmd>lua vim.lsp.buf.signature_help()<cr>', opts2)
		vim.keymap.set('n',	'<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts2)
		vim.keymap.set('n',	'<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts2)
		vim.keymap.set({'n','x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts2)
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
		lua_ls = function ()
			require('lspconfig').lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = {'vim', 'lsp_servers', 'ls'},
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
		{name = 'nvim_lsp'},
		{name = 'nvim_lsp_signature_help'},
		{name = 'calc'}
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-Space>'] = cmp.mapping.complete(),
	}, {
		{name = 'buffer'},
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
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
	fold_virt_text_handler = handler,
    -- provider_selector = function(_, _, _)
    --     return {'treesitter', 'indent'}
    -- end
})

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
	callback = function ()
		vim.fn.jobstart('!notify-send "hello"', {detach=true})
	end,
})
