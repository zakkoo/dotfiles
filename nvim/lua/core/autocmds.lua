-- Autocommands grouped for clarity.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", { clear = true })

-- Highlight text after yanking.
autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

local highlight_group = augroup("LspDocumentHighlight", { clear = true })

autocmd({ "CursorHold", "CursorHoldI" }, {
  group = highlight_group,
  callback = function()
    vim.lsp.buf.document_highlight()
  end,
})

autocmd({ "CursorMoved", "CursorMovedI", "BufLeave" }, {
  group = highlight_group,
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})
