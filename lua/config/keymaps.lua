-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- toggle rspec
vim.keymap.set("n", "<leader>rs", "<cmd>lua Go_to_test()<CR>", { noremap = true, silent = true, desc = "Go to test" })
vim.keymap.set(
  "n",
  "<leader>ry",
  "<cmd>lua Copy_file_path()<CR>",
  { noremap = true, silent = true, desc = "Copy file path" }
)
vim.keymap.set(
  "n",
  "<leader>fo",
  "<cmd>lua Find_code_owners()<CR>",
  { noremap = true, silent = true, desc = "Find code owners" }
)
