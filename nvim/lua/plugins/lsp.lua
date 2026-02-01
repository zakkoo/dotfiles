-- Language Server Protocol configuration.

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Mason LSP setup
    require("mason-lspconfig").setup({
      ensure_installed = { "omnisharp", "ts_ls", "html", "cssls" },
    })

    -- LSP server configurations
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

    -- LSP document highlight autocmds
    local highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = highlight_group,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufLeave" }, {
      group = highlight_group,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end,
}
