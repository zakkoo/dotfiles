-- Mason LSP configuration.

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "omnisharp", "ts_ls", "html", "cssls" },
    })
  end,
}
