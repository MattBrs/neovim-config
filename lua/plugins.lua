local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/autoload/plugged")

-- Auto pairs for (, [, {
-- Plug 'jiangmiao/auto-pairs'
Plug("windwp/nvim-autopairs")

-- Better syntax support
-- Plug 'sheerun/vim-polyglot'

-- multicursor
Plug("mg979/vim-visual-multi")

-- Monokai theme
Plug("tanvirtin/monokai.nvim")

-- formatting
Plug("lukas-reineke/lsp-format.nvim")

-- Better syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- file manager written in lua
Plug("elihunter173/dirbuf.nvim")

-- debugger
Plug("mfussenegger/nvim-dap")
Plug("mfussenegger/nvim-dap")
Plug("nvim-neotest/nvim-nio")
Plug("rcarriga/nvim-dap-ui")

-- fuzzy finder
Plug("ibhagwan/fzf-lua", { branch = "main" })

Plug("akinsho/toggleterm.nvim", { tag = "*" })

-- faster text hopping
Plug("phaazon/hop.nvim")

-- comments
Plug("numToStr/Comment.nvim")

-- LSP Support
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

-- Autocompletion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")

Plug("VonHeikemen/lsp-zero.nvim", { branch = "v2.x" })

-- function signature help
Plug("hrsh7th/cmp-nvim-lsp-signature-help")

-- formatter
Plug("mhartington/formatter.nvim")

-- undo branches
Plug("mbbill/undotree")

-- git info beside the code
Plug("lewis6991/gitsigns.nvim")

Plug("folke/trouble.nvim")

-- best git manager
Plug("kdheepak/lazygit.nvim")

-- silly icons
Plug("nvim-tree/nvim-web-devicons")

-- make nvim transparent
Plug("xiyaowong/transparent.nvim")

-- make dirs recursively before saving file
Plug("jghauser/mkdir.nvim")

-- theme
Plug("EdenEast/nightfox.nvim")

-- peek rows without moving
Plug("nacro90/numb.nvim")

Plug("simrat39/rust-tools.nvim")

Plug("ojroques/nvim-hardline")
vim.call("plug#end")
