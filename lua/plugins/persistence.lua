return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = function()
		vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
		require("persistence").setup({
			dir = vim.fn.stdpath("state") .. "/sessions/",
			need = 1,
			branch = true,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistenceSavePre",
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_valid(buf) then
						local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
						if ft == "oil" then
							vim.bo[buf].buflisted = false
						end
					end
				end
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistenceLoadPost",
			callback = function()
				-- Multiple attempts to close Oil with increasing delays
				for i = 1, 3 do
					vim.defer_fn(function()
						for _, buf in ipairs(vim.api.nvim_list_bufs()) do
							if vim.api.nvim_buf_is_valid(buf) then
								local ok, ft = pcall(vim.api.nvim_get_option_value, "filetype", { buf = buf })
								if ok and ft == "oil" then
									pcall(vim.api.nvim_buf_delete, buf, { force = true })
								end
							end
						end
					end, i * 100) -- 100ms, 200ms, 300ms delays
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Restore Session",
		},
		{
			"<leader>qS",
			function()
				require("persistence").select()
			end,
			desc = "Select Session",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore Last Session",
		},
		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "Don't Save Current Session",
		},
	},
}
