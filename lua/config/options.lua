vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.cursorline = true
vim.o.laststatus = 3

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.diagnostic.config({
	virtual_text = true, -- show errors/warnings inline as virtual text
	underline = true, -- underline problematic text
	update_in_insert = true,
})
