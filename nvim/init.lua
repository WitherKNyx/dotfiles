local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug('akinsho/git-conflict.nvim')                                                   -- Git Merge conflicts
Plug('benknoble/vim-mips')                                                          -- MIPS
Plug('dense-analysis/ale')                                                          -- ALE
Plug('dracula/vim')                                                                 -- Dr. A. Cula
Plug('Eandrju/cellular-automaton.nvim')                                             -- Cellular Automata
Plug('github/copilot.vim')                                                          -- GitHub Copilot
Plug('iamcco/markdown-preview.nvim', {['do'] = vim.fn['cd app && yarn install']})   -- Markdown Previews
Plug('kyazdani42/nvim-web-devicons')                                                -- DevIcons
Plug('lewis6991/gitsigns.nvim')                                                     -- Git Signs
Plug('lukas-reineke/indent-blankline.nvim')                                         -- Indent marks
Plug('luochen1990/rainbow')                                                         -- Rainbow Parentheses
Plug('MunifTanjim/nui.nvim')                                                        -- UI Component Library
Plug('machakann/vim-highlightedyank')                                               -- Highlight Yank region
Plug('mlr-msft/vim-loves-dafny', {['for'] = 'dafny'})                               -- Dafny
Plug('neoclide/coc.nvim', {branch = 'release'})                                     -- Code Completion
Plug('norcalli/nvim-colorizer.lua')                                                 -- Color HL
Plug('nvim-lua/plenary.nvim')                                                       -- Lua functions
Plug('nvim-neo-tree/neo-tree.nvim')                                                 -- Access file systems
Plug('nvim-telescope/telescope.nvim')                                               -- Access files
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})             -- Syntax highlighter
Plug('preservim/tagbar')                                                            -- Class outline
Plug('ray-x/lsp_signature.nvim')                                                    -- Function signatures
Plug('ryanoasis/vim-devicons')                                                      -- Icons for Plugins
Plug('tanvirtin/monokai.nvim')                                                      -- Monokai
Plug('terryma/vim-multiple-cursors')                                                -- Multiple Cursors, Ctrl + N
Plug('tpope/vim-commentary')                                                        -- Comment things out easier
Plug('tpope/vim-sleuth')                                                            -- Guess tabs and indents
Plug('tpope/vim-surround')                                                          -- Easy bracket manip
Plug('universal-ctags/ctags')                                                       -- Tagbar Supplement
Plug('vim-airline/vim-airline')                                                     -- Status bar :)
Plug('vim-airline/vim-airline-themes')                                              -- Themes!
Plug('vim-autoformat/vim-autoformat')                                               -- Autoformat
Plug('vim-latex/vim-latex')                                                         -- LaTeX
Plug('wakatime/vim-wakatime')                                                       -- Wakatime
Plug('WitherKNyx/LovelyNightEighties', {rtp = 'nvim'})                              -- My theme :3

vim.call('plug#end')

vim.opt.termguicolors = true
require'colorizer'.setup()

-- Basic Settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.mouse = "a"

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.cindent = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g['Tex_AdvancedMath'] = 1
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
]]

require'nvim-treesitter.configs'.setup{highlight={enable=true}}

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
-------------------------- Tagbar ----------------------------
vim.keymap.set('n', '<F8>', 'TagbarToggle', {})

--------------------- Telescope Settings ---------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

-----------------------  CoC Settings  -----------------------
-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
