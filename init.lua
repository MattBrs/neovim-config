require("config.lazy")
require("config.lsp")
require("config.tree_sitter")
require("config.conform")
vim.cmd("source ~/.config/nvim/keybindings.vim")

vim.lsp.set_log_level("off")

local set = vim.opt

set.cursorline = true
set.tabstop = 4
set.softtabstop = 4
set.incsearch = true
set.hlsearch = true
set.colorcolumn = "80"
set.autoindent = true
set.ignorecase = true
set.expandtab = true
set.relativenumber = true
set.clipboard = "unnamed,unnamedplus"
set.ttyfast = true
set.syntax = "true"
set.showmatch = true
set.shiftwidth = 4
set.nu = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.swapfile = false

vim.cmd.colorscheme("habamax")
