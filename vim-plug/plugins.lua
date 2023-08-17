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

 -- formatting 
 Plug 'lukas-reineke/lsp-format.nvim'

 -- Better syntax highlighting
 Plug 'nvim-treesitter/nvim-treesitter'
 
 -- file manager written in lua
 Plug "elihunter173/dirbuf.nvim"

 -- debugger
 Plug 'mfussenegger/nvim-dap'

 -- fuzzy finder
 Plug("ibhagwan/fzf-lua", {branch= "main"})

 -- faster text hopping 
 Plug 'phaazon/hop.nvim'

 -- comments
 Plug 'numToStr/Comment.nvim'

vim.call('plug#end')
