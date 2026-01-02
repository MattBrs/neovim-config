require("config.lazy")
require("config.lsp")
require("config.tree_sitter")
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

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd.colorscheme("habamax")
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })


function PopulateArgs(text)
    local command = string.format("args `rg -l %s`", text)
    vim.cmd(command)
end

function Replace(pattern, text)
    local command = "argdo %s/" .. pattern .. "/" .. text .. "/gc"
    vim.cmd(command)
end

function SaveFiles()
    local command = "argdo update"
    vim.cmd(command)
end

vim.keymap.set("n", "<Space>rtp", function()
    local pattern = vim.fn.input("Enter pattern to search: ")
    local replacement = vim.fn.input("Enter replacement for pattern: ")

    PopulateArgs(pattern)
    Replace(pattern, replacement)
    SaveFiles()
end)
