call plug#begin('~/.config/nvim/autoload/plugged')

 " Icons for nerdtree
 Plug 'ryanoasis/vim-devicons' 

 " File explorer
 Plug 'scrooloose/nerdtree'

 " Auto pairs for (, [, {
 Plug 'jiangmiao/auto-pairs'

 " Better syntax support
 Plug 'sheerun/vim-polyglot'

 " Code completition
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " Monokai theme
 Plug 'tanvirtin/monokai.nvim'

 " file search
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

 " formatting 
 Plug 'lukas-reineke/lsp-format.nvim'

 call plug#end()
