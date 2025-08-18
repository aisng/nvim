return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	enabled = true,
	opts = function()
		local navic = require("nvim-navic")
		return {
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					},
				},
			},
		}
	end,
}
