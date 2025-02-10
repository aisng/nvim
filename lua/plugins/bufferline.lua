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
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          text_align = "center",
        },
      },
    },
  },
}
