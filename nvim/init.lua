require('keymaps')
require('config')
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
Plug('hrsh7th/cmp-buffer')                                                   -- nvim-cmp for buffer
Plug('hrsh7th/cmp-calc')                                                     -- nvim-cmp for math
Plug('hrsh7th/cmp-cmdline')                                                  -- nvim-cmp for cmdline
Plug('hrsh7th/cmp-emoji')                                                    -- nvim-cmp for emoji
Plug('hrsh7th/cmp-path')                                                     -- nvim-cmp for path
Plug('kdheepak/cmp-latex-symbols')											 -- nvim-cmp for latex symbols
Plug('hrsh7th/cmp-nvim-lsp-signature-help')                                  -- nvim-cmp for lsp-signature
Plug('L3MON4D3/LuaSnip', { tag = 'v2.*', ['do'] = 'make install_jsregexp' }) -- Snippets
Plug('saadparwaiz1/cmp_luasnip')                                             -- nvim-cmp for LuaSnip

---- Aesthetic
Plug('dracula/vim')                                      -- Dr. A. Cula
Plug('folke/noice.nvim')                                 -- Better menus
Plug('HiPhish/rainbow-delimiters.nvim')                  -- Rainbow Parentheses
Plug('kyazdani42/nvim-web-devicons')                     -- DevIcons
Plug('levouh/tint.nvim')                                 -- Tinting Windows
Plug('lewis6991/gitsigns.nvim')                          -- Git Signs
Plug('lukas-reineke/indent-blankline.nvim')              -- Indent marks
Plug('machakann/vim-highlightedyank')                    -- Highlight Yank region
Plug('MunifTanjim/nui.nvim')                             -- UI Component Library
Plug('norcalli/nvim-colorizer.lua')                      -- Color HL
Plug('nvim-lualine/lualine.nvim')                        -- Statusline
Plug('rcarriga/nvim-notify')                             -- Notifications
Plug('ryanoasis/vim-devicons')                           -- Icons for Plugins
Plug('tanvirtin/monokai.nvim')                           -- Monokai
Plug('WitherKNyx/LovelyNightEighties', { rtp = 'nvim' }) -- My theme :3

---- Extra Functionality
Plug('akinsho/git-conflict.nvim')                                         -- Git Merge conflicts
Plug('benfowler/telescope-luasnip.nvim')
Plug('kevinhwang91/nvim-ufo')                                             -- Better folds
Plug('kevinhwang91/promise-async')                                        -- Req for ^
Plug('lervag/vimtex')                                                     -- LaTeX Tools
Plug('numToStr/Comment.nvim')                                             -- Commenting Binds
Plug('nvim-lua/plenary.nvim')                                             -- Lua functions
Plug('nvim-neo-tree/neo-tree.nvim')                                       -- Access file systems
Plug('nvim-telescope/telescope.nvim')                                     -- Access files
Plug('nvim-telescope/telescope-fzf-native.nvim')                          -- Use fzf ^
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] }) -- Syntax highlighter
Plug('stevearc/aerial.nvim')                                              -- Tags
Plug('terryma/vim-multiple-cursors')                                      -- Multiple Cursors, Ctrl + N
Plug('tomiis4/BufferTabs.nvim')                                           -- Tabs
Plug('tpope/vim-surround')                                                -- Easy bracket manip
Plug('universal-ctags/ctags')                                             -- Tagbar Supplement

---- Extra Langs
Plug('benknoble/vim-mips')                              -- MIPS
Plug('mlr-msft/vim-loves-dafny', { ['for'] = 'dafny' }) -- Dafny

---- Misc
Plug('Eandrju/cellular-automaton.nvim') -- Cellular Automata
Plug('wakatime/vim-wakatime')           -- Wakatime

vim.call('plug#end')

vim.cmd('colorscheme lovelynight80s')

-------------------------  Plugin Settings  -------------------------
require('config._nvim-web-devicons')
require('config._aerial')
require('config._notify')
require('config._lualine')
require('config._luasnip')
require('config._rainbow-delimiters')
require('config._telescope')
require('config._lsp')
require('config._noice')
require('config._ufo')

require('colorizer').setup()
require('Comment').setup()
require('ibl').setup()
require('tint').setup()

require('nvim-treesitter.configs').setup({ highlight = { enable = true } })

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
	callback = function()
		vim.fn.jobstart('!notify-send "hello"', { detach = true })
	end,
})
