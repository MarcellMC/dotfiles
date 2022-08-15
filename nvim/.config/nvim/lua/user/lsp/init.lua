local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('lspconfig').sumneko_lua.setup{}
require('lspconfig').solargraph.setup{}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "solargraph" },
    automatic_installation = true
})
-- require("user.lsp.configs")
-- require("user.lsp.handlers").setup()
