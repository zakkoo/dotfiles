-- Surround text objects with pairs, tags, or custom delimiters

return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}
