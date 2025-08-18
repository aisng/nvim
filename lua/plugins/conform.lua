return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			rubocop = {
				command = "mise",
				args = { "exec", "--", "bundle", "exec", "rubocop", "--autocorrect", "$FILENAME" },
				stdin = false,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			ruby = { "rubocop" },
			go = { "gofmt" },
		},
		format_on_save = { timeout_ms = 5000 },
	},
}
