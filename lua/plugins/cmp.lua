return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert({
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Up>"] = cmp.mapping.select_prev_item(),

				["<C-n>"] = cmp.mapping.scroll_docs(-4),
				["<C-p>"] = cmp.mapping.scroll_docs(4),

				["<Right>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
		})
	end,
}
