-- Language Server Protocol configuration.

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("omnisharp", {
      capabilities = capabilities,
      enable_import_completion = true,
      organize_imports_on_format = true,
    })
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("cssls", { capabilities = capabilities })

    vim.lsp.enable({ "omnisharp", "ts_ls", "html", "cssls" })
  end,
}
