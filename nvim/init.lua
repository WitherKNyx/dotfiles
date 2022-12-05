local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'akinsho/git-conflict.nvim' -- Git Merge conflicts
Plug 'ap/vim-css-color' -- CSS Colors
Plug 'dense-analysis/ale'
Plug 'dracula/vim' -- Dr. A. Cula
Plug('iamcco/markdown-preview.nvim', {['do'] = vim.fn['cd app && yarn install']}) -- Markdown Previews
Plug 'kyazdani42/nvim-web-devicons' -- DevIcons
Plug 'lewis6991/gitsigns.nvim' -- Git Signs
Plug 'lukas-reineke/indent-blankline.nvim' -- Indent marks
Plug 'MunifTanjim/nui.nvim' -- UI Component Library
Plug 'machakann/vim-highlightedyank' -- Highlight Yank region
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'nvim-lua/plenary.nvim' -- Lua functions
Plug 'nvim-neo-tree/neo-tree.nvim' -- Access file systems
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug 'preservim/tagbar'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tanvirtin/monokai.nvim' -- Monokai
Plug 'terryma/vim-multiple-cursors'
Plug 'tc50cal/vim-terminal'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth' -- Guess tabs and indents
Plug 'tpope/vim-surround' -- Easy bracket manip
Plug 'universal-ctags/ctags'
Plug 'vim-airline/vim-airline' -- Status bar :)
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime' -- Wakatime
Plug('WitherKNyx/LovelyNightEighties', {rtp = 'nvim'})

vim.call('plug#end')

-- Basic Settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.mouse = "a"

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true

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
]]

require'nvim-treesitter.configs'.setup{highlight={enable=true}}

-- vim.keymap.set('n', '<code>', TagbarToggle, {})

---------------------- Indent Settings --------------------
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FF8C8E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#FFEA80 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#8AE599 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#73E5E5 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#7399E5 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#E391E5 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-------------------- Telescope Settings --------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

----------------------- CoC Settings -----------------------
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
