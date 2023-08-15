dofile('/home/matteo/.config/nvim/vim-plug/plugins.lua')
dofile('/home/matteo/.config/nvim/tree-sitter-config.lua')
vim.cmd('source ~/.config/nvim/keybindings.vim')

local set = vim.opt

set.cursorline = true
set.tabstop = 4
set.softtabstop = 4
set.incsearch = true
set.hlsearch = true
set.colorcolumn = '80'
set.autoindent = true
set.ignorecase = true
set.expandtab = true
set.number = true
set.clipboard = 'unnamedplus'
set.ttyfast = true
set.syntax = 'true'
set.showmatch = true
set.shiftwidth = 4

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd("colorscheme monokai_ristretto")


