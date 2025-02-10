return {
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000,
  --   opts = {
  --     style = "dark",
  --   },
  -- },

  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "material"
      vim.g.gruvobox_material_foreground = "original"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
