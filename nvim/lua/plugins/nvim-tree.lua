-- File explorer with icon support

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = { width = 32 },
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
					},
				},
			},
		})
	end,
}
