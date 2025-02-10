-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start({
      name = "rubocop",
      cmd = { "bundle", "exec", "rubocop", "--lsp" },
    })
  end,
})
require("lualine").setup({
  options = {
    theme = "gruvbox-material",
  },
})
