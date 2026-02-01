-- Editor enhancement plugins for improved text editing.

return {
  -- Auto-close pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Surround text objects
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
}
