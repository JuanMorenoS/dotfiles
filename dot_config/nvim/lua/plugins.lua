local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- UI, Themes, etc....
	use("feline-nvim/feline.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("p00f/nvim-ts-rainbow")
	use("nvim-lua/plenary.nvim")
	use("EdenEast/nightfox.nvim")
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Git tools
	use("lewis6991/gitsigns.nvim")

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Finders
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.x" })
	use({ "BurntSushi/ripgrep" })

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- Installing LSP servers
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("j-hui/fidget.nvim")
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
        use("joechrisellis/lsp-format-modifications.nvim")

	-- Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Formatters
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Comment the lines gcc
	use("numToStr/Comment.nvim")

	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- remember the last position of the cursor
	use("farmergreg/vim-lastplace")

	-- startup page
	use("goolord/alpha-nvim")

	-- leap (fast test jumper)
	use("ggandor/leap.nvim")

	-- vimwiki to start taking notes and code examples
	use("lervag/wiki.vim")
	use("godlygeek/tabular")
	use("preservim/vim-markdown")

	-- Pane navigation
	use("christoomey/vim-tmux-navigator")

	-- Multi cursor
	use("mg979/vim-visual-multi")

	-- Notify
	use("rcarriga/nvim-notify")

	-- Which key
	use("folke/which-key.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
