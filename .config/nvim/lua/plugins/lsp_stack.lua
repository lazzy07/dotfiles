-- NvChad 2.5 – plugin spec
return {
	-- Mason core
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd", -- C / C++ / CUDA
				"cmake",
				"dockerls",
				"yamlls",
				"bashls",
				"jsonls",
			},
		},
	},

	----------------------------------------------------------------
	-- 1-line LSP setups (everything except clangd uses defaults) --
	----------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")

			-- clangd: treat .cu as C++
			lsp.clangd.setup({
				cmd = { "clangd", "--offset-encoding=utf-16" },
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				on_attach = function(_, bufnr)
					-- keymaps, inlay hints, etc. if you want them
				end,
				capabilities = vim.tbl_extend(
					"force",
					vim.lsp.protocol.make_client_capabilities(),
					require("cmp_nvim_lsp").default_capabilities()
				),
			})
		end,
	},
}
