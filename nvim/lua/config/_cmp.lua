local cmp = require('cmp')
local luasnip = require('luasnip')
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'calc' },
		{ name = 'emoji' },
		{ name = 'path' },
		--{ name = 'luasnip' },
		{
			name = "latex_symbols",
			option = {
				strategy = 0, -- mixed
			}
		},
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	
	mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.mapping.confirm({ select = false }),
			['<C-Space>'] = cmp.mapping.complete(),
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		{
			{ name = 'buffer' }
		})
})

-- cmp for searching
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end)
	}),
	sources = {
		{ name = 'buffer' }
	}
})

-- cmp for cmdline
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end)
	}),
	sources = cmp.config.sources({
			{ name = 'path' }
		},
		{
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' }
				}
			}
		})
})
