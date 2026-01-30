-- External tool installer.

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = { "csharpier", "eslint_d", "prettier", "stylelint" },
    })
  end,
}
