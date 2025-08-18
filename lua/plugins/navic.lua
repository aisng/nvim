return {
	"SmiteshP/nvim-navic",
	lazy = true,
	init = function()
		vim.g.navic_silence = true
	end,
	opts = {
		separator = " ",
		highlight = true,
		depth_limit = 5,
		lazy_update_context = true,
		safe_output = true,
	},
}
