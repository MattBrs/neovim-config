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
set.relativenumber = true
set.clipboard = 'unnamedplus'
set.ttyfast = true
set.syntax = 'true'
set.showmatch = true
set.shiftwidth = 4

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd("colorscheme monokai_ristretto")

-- setup plugins
require'hop'.setup()
require'Comment'.setup()

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
					return
				end
				fallback()
			end
	    ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
			    if cmp.visible() then
				    cmp.select_prev_item()
					return
				end
				fallback()
			end
	    ),
    }),
    sources = {
        { name = 'nvim_lsp_signature_help' }, 
        { name = 'buffer'}, {name = 'nvim_lsp'}, {name = "ultisnips" },
        { name = "nvim_lua"}, {name = "look"}, {name = "path" },
    },
})
