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
vim.opt.swapfile = false

-- vim.cmd("colorscheme catpuccin")
vim.cmd.colorscheme("monokai_ristretto")
-- setup plugins
require("hop").setup()
require("Comment").setup()
require("toggleterm").setup()
require("gitsigns").setup()
require("dapui").setup()
require("hardline").setup({
	bufferline = false, -- disable bufferline
	bufferline_settings = {
		exclude_terminal = false, -- don't show terminal buffers in bufferline
		show_index = false, -- show buffer indexes (not the actual buffer numbers) in bufferline
	},
	theme = "default", -- change theme
	sections = { -- define sections
		{ class = "mode", item = require("hardline.parts.mode").get_item },
		{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
		{ class = "med", item = require("hardline.parts.filename").get_item },
		"%<",
		{ class = "med", item = "%=" },
		{ class = "low", item = require("hardline.parts.wordcount").get_item, hide = 100 },
		{ class = "error", item = require("hardline.parts.lsp").get_error },
		{ class = "warning", item = require("hardline.parts.lsp").get_warning },
		{ class = "warning", item = require("hardline.parts.whitespace").get_item },
		{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 60 },
		{ class = "mode", item = require("hardline.parts.line").get_item },
	},
})

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- vim.lsp.inlay_hint.enable(true)

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

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

-- Utilities for creating configurations
local util = require("formatter.util")

require("nvim-autopairs").setup({})

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

-- debugger
local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/Cellar/llvm@17/17.0.6/bin/lldb-vscode", -- adjust as needed, must be absolute path
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = { "${workspaceFolder}/configuration.hora" },

		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}

require("numb").setup()

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
