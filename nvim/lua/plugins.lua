require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- =====================
	-- UI STUFF
	-- =====================
	-- Top buffer/tab line
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	-- Gruvbox theme
	use("morhetz/gruvbox")
	-- Dracula
	use({ "darker-dracula/vim", as = "dracula" })
	-- use("~/dev/darker-dracula/vim")
	use("mangeshrex/uwu.vim")
	-- github theme
	use("projekt0n/github-nvim-theme")
	-- Git in the gutter
	use("lewis6991/gitsigns.nvim")
	-- dev-icons
	use("kyazdani42/nvim-web-devicons")
	-- UI stuff (mainly used for lsp overrides)
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	-- Trouble
	use("folke/trouble.nvim")
	-- Colorizer
	use("norcalli/nvim-colorizer.lua")
	-- indent lines
	use("lukas-reineke/indent-blankline.nvim")
	-- statusline
	-- use({ "famiu/feline.nvim", branch = "develop" })
	use({ "famiu/feline.nvim" })

	use("tpope/vim-scriptease")
	-- symbols outline for viewing symbols in a tree like view
	use("simrat39/symbols-outline.nvim")
	-- =====================
	-- TELESCOPE
	-- =====================
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
	})
	use({
		"romgrk/fzy-lua-native",
		requires = { { "nvim-telescope/telescope.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		requires = { { "nvim-telescope/telescope.nvim" } },
	})

	-- =====================
	-- Coding stuff
	-- =====================
	-- note/organization stuff
	use("nvim-lua/plenary.nvim")

    -- =====================
    -- LSP stuff
    -- =====================
    use('williamboman/mason.nvim')    
    use('williamboman/mason-lspconfig.nvim')
	use("neovim/nvim-lspconfig")
    
    -- Completion framework:
    use('hrsh7th/nvim-cmp') 

    -- LSP completion source:
    use('hrsh7th/cmp-nvim-lsp')

    -- Useful completion sources:
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    use('hrsh7th/cmp-vsnip')                             
    use('hrsh7th/cmp-path')                              
    use('hrsh7th/cmp-buffer')                            
    use('hrsh7th/vim-vsnip')     
	use("hrsh7th/cmp-emoji")
    --
    -- =====================
    -- Rust stuff
    -- =====================
    use('simrat39/rust-tools.nvim')


	-- tree-sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	-- Lua dev
	use("folke/lua-dev.nvim")

	-- Ranger
	use({ "kevinhwang91/rnvimr", run = ":make sync" })
	-- Comments
	use({
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("utils.comment").setup()
		end
	})
	-- Set root directory properly
	use("airblade/vim-rooter")
	-- Show a popup with signature info
	use("ray-x/lsp_signature.nvim")
	-- idk
	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	-- =====================
	-- OTHERS
	-- =====================
	-- Pairs ()
	use("windwp/nvim-autopairs")
	-- Startify
	use("mhinz/vim-startify")
	-- Which key
	-- use("liuchengxu/vim-which-key")
	use("folke/which-key.nvim")
	-- git
	use("tpope/vim-fugitive")
	use("antoinemadec/FixCursorHold.nvim")
	-- file trees
	use("kyazdani42/nvim-tree.lua")
	-- tpope
	use("tpope/vim-surround")
end)
