return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        cpp = { "clang_format" },
        c = { "clang_format" },
        go = { "gofmt", "goimports" },
        rust = { "rustfmt" },
        csharp = { "csharpier" },
        haskell = { "fourmolu" },
        html = { "prettierd", "prettier" },
        xml = { "prettierd", "prettier" },
      },
    },
  },
}
