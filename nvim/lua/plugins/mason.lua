-- Mason package manager for LSP servers, formatters, and linters.

return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- Automatically install formatters and linters
    require("mason-tool-installer").setup({
      ensure_installed = { "csharpier", "eslint_d", "prettier", "stylelint" },
    })
  end,
}
