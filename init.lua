-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.signcolumn = "yes"

require("lualine").setup({
  options = {
    theme = "gruvbox-material",
  },
})
