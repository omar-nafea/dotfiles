-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- mason.nvim setup
mason.setup()

-- mason.nvim setup
require("mason").setup()

-- mason-lspconfig setup with list of servers to ensure installed
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- Lua language server
		"pyright", -- Python LSP
		"ruff_lsp", -- Python linting with ruff
		"ts_ls", -- TypeScript server (tsserver deprecated)
		"eslint", -- ESLint
		"tailwindcss", -- TailwindCSS LSP
		"emmet_ls", -- Emmet language server
		"jsonls", -- JSON language server
	},
})

-- Automatically install the ensured servers and set up handlers
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler for all servers
		-- Replace tsserver with ts_ls
		if server_name == "tsserver" then
			server_name = "ts_ls"
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Setup each LSP server
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- Add your on_attach settings here if needed
			end,
		})
	end,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
