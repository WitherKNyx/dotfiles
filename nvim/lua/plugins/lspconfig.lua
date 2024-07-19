return {{
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' }
	},
	cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local lspconfig = require('lspconfig')
		local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
		lsp_capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}
		local default_setup = function(server)
			lspconfig[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			group = group,
			callback = function(event)
				local bufmap = function(mode, lhs, rhs, desc)
					local opts = {buffer = event.buf, desc = desc}
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover documentation')
				bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
				bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration')
				bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation')
				bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Go to type definition')
				bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to reference')
				bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show function signature')
				bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
				bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format buffer')
				bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Execute code action')
				bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show line diagnostic')
				bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous diagnostic')
				bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic')
			end
		})

		require('mason-lspconfig').setup({
			ensure_installed = lsp_servers,
			handlers = {
				default_setup,
				lua_ls = function()
					lspconfig.lua_ls.setup({
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
	end
}}
