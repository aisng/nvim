return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			max_name_length = 30,
			numbers = "buffer_id",
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		local keymap = vim.keymap.set

		-- navigate visually in bufferline
		keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
		keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
	end,
}
