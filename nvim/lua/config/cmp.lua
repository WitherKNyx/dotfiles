local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'calc' },
		{ name = 'emoji' },
		{ name = 'path' }
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.mapping.confirm({ select = false }),
			['<C-Space>'] = cmp.mapping.complete(),
		},
		{
			{ name = 'buffer' }
		})
})

-- cmp for searching
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- cmp for cmdline
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
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
