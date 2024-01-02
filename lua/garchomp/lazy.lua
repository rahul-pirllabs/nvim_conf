local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" 
if not vim.loop.fs_stat(lazypath) then   
	vim.fn.system({     
		"git",     
		"clone",     
		"--filter=blob:none",     
		"https://github.com/folke/lazy.nvim.git",    
		"--branch=stable", -- latest stable release     
		lazypath,   
	}) 
end 
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- Themes
	{
		"rose-pine/neovim",
		name = 'rose-pine',
		lazy = false,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = false,
		priority=1000,
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
			highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},
	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch="harpoon2",
		dependencies={ "nvim-lua/plenary.nvim" }
	},
	-- Undotree
	{
		"mbbill/undotree"
	},
	-- Git
	{
		"tpope/vim-fugitive"
	},
	-- LSP
	-- Uncomment these if you want to manage the language servers from neovim
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
}

-- Lazy plugin manager
require("lazy").setup(plugins, opts)
