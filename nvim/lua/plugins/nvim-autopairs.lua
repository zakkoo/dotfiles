-- Auto-close pairs like brackets, quotes, and parentheses

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
}
