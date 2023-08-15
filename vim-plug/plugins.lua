
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/autoload/plugged')

 -- Auto pairs for (, [, {
 Plug 'jiangmiao/auto-pairs'

 -- Better syntax support
 Plug 'sheerun/vim-polyglot'

 -- Code completition
 Plug('neoclide/coc.nvim', {branch = 'release'})

 -- Monokai theme
 Plug 'tanvirtin/monokai.nvim'

 -- file search
 Plug 'nvim-lua/plenary.nvim'
 Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

 -- formatting 
 Plug 'lukas-reineke/lsp-format.nvim'

 -- file explorer
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'nvim-tree/nvim-web-devicons'

 -- Better syntax highlighting
 -- Plug('nvim-treesitter/nvim-treesitter', {do = ':TSUpdate'})

vim.call('plug#end')
