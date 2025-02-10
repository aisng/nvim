-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  autocmd ColorScheme * highlight TSParameter guifg=#ffb376
  autocmd ColorScheme * highlight TSParameterReference guifg=#fe8019
  " autocmd ColorScheme * highlight! link TSConstant TSType
]])
