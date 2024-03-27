require("plugins")
require("tree-sitter-config")
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
set.clipboard = "unnamedplus"
set.ttyfast = true
set.syntax = "true"
set.showmatch = true
set.shiftwidth = 4
set.nu = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd("colorscheme monokai")

-- setup plugins
require("hop").setup()
require("Comment").setup()
require("toggleterm").setup()
require("gitsigns").setup()

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                return
            end
            fallback()
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                return
            end
            fallback()
        end),
    }),
    sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "nvim_lua" },
        { name = "look" },
        { name = "path" },
    },
})

-- Utilities for creating configurations
local util = require("formatter.util")

require("nvim-autopairs").setup {}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },
        cpp = {
            require("formatter.filetypes.cpp").clangformat,
        },
        c = {
            require("formatter.filetypes.c").clangFormat,
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier,
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            -- require("formatter.filetypes.any").remove_trailing_whitespace,
            function()
                vim.lsp.buf.format()
            end,
        },
    },
})
