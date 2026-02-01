-- Linting integration.

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      css = { "stylelint" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      scss = { "stylelint" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local group = vim.api.nvim_create_augroup("Linting", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = group,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
