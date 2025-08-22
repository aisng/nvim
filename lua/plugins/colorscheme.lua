return {
	"lewpoly/sherbet.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("sherbet")
	end,
	opts = { ... },
}
