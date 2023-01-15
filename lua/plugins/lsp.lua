return {
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'lukas-reineke/lsp-format.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Progress
			{ "j-hui/fidget.nvim" },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			-- Snippet Collection (Optional)
			{ 'rafamadriz/friendly-snippets' },
		},
		config = function()
			require("fidget").setup()

			local lsp = require("lsp-zero")
			lsp.preset("recommended")


			-- Ensure these servers are always installed
			lsp.ensure_installed({
				'astro',
				'bashls',
				'clangd',
				'cssls',
				'denols',
				'dockerls',
				'eslint',
				'gopls',
				'html',
				'intelephense',
				'jsonls',
				'rust_analyzer',
				'sqlls',
				'sumneko_lua',
				'svelte',
				'tailwindcss',
				'tsserver',
				'vimls',
				'volar',
				'yamlls',
			})

			-- Configure lua language server for neovim
			lsp.nvim_workspace()

			-- Configure auto-formatting
			require("lsp-format").setup()

			lsp.on_attach(function(client, bufnr)

				-- Exclude specific clients from autoformatting
				require("lsp-format").on_attach(
					client,
					{
						exclude = { "eslint" }
					}
				)

				local opts = { buffer = bufnr, remap = false }
				local bind = vim.keymap.set

				bind("n", "<leader>cD", function() vim.lsp.buf.declaration() end, opts)
				bind("n", "<leader>cd", function() vim.lsp.buf.definition() end, opts)
				bind("n", "<leader>ci", function() vim.lsp.buf.implementation() end, opts)
				bind("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
				bind("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
				bind("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
				bind("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
				bind("n", "<leader>ck", function() vim.diagnostic.open_float() end, opts)
				bind("n", "<leader>dj", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
				bind("n", "<leader>dk", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
			end)

			-- Configure keybindings
			local cmp = require("cmp")
			local cmp_mappings = lsp.defaults.cmp_mappings({
				['<C-k>'] = cmp.mapping.select_prev_item(),
				['<C-j>'] = cmp.mapping.select_next_item(),
			})

			-- disable existing mappings
			cmp_mappings['<Tab>'] = nil
			cmp_mappings['<S-Tab>'] = nil
			cmp_mappings['<CR>'] = nil

			cmp.setup({
				preselect = cmp.PreselectMode.None,
			})

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings,
			})

			lsp.setup()
		end
	}
}
