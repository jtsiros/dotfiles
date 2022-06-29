local wk = require("which-key")

local config = {
	setup = {
		active = true,
		on_config_done = nil,
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ...
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
			spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
	},
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	vopts = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	vmappings = {
		["/"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
	},
	mappings = {
		["w"] = { "<cmd>w!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },
		["c"] = { "<cmd>bw!<CR>", "Close Buffer" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
		b = {
			name = "Buffers",
			j = { "<cmd>BufferPick<CR>", "Jump" },
			f = { "<cmd>Telescope buffers<CR>", "Find" },
			b = { "<cmd>bprevious<CR>", "Previous" },
			w = { "<cmd>bw<CR>", "Wipeout" },
			e = {
				"<cmd>BufferCloseAllButCurrent<CR>",
				"Close all but current",
			},
			h = { "<cmd>BufferCloseBuffersLeft<CR>", "Close all to the left" },
			l = {
				"<cmd>BufferCloseBuffersRight<CR>",
				"Close all to the right",
			},
			D = {
				"<cmd>BufferOrderByDirectory<CR>",
				"Sort by directory",
			},
			L = {
				"<cmd>BufferOrderByLanguage<CR>",
				"Sort by language",
			},
		},
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<CR>", "Compile" },
			i = { "<cmd>PackerInstall<CR>", "Install" },
			r = { "<cmd>lua require('lvim.plugin-loader').recompile()<CR>", "Re-compile" },
			s = { "<cmd>PackerSync<CR>", "Sync" },
			S = { "<cmd>PackerStatus<CR>", "Status" },
			u = { "<cmd>PackerUpdate<CR>", "Update" },
		},
		g = {
			name = "Git",
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
			C = {
				"<cmd>Telescope git_bcommits<CR>",
				"Checkout commit(for current file)",
			},
			d = {
				"<cmd>Gitsigns diffthis HEAD<CR>",
				"Git Diff",
			},
		},
		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Buffer Diagnostics" },
			w = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
			i = { "<cmd>LspInfo<CR>", "Info" },
			I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
			j = {
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				"Next Diagnostic",
			},
			k = {
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				"Prev Diagnostic",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
			p = {
				name = "Peek",
				d = { "<cmd>lua require('peek').Peek('definition')<CR>", "Definition" },
				t = { "<cmd>lua require('peek').Peek('typeDefinition')<CR>", "Type Definition" },
				i = { "<cmd>lua require('peek').Peek('implementation')<CR>", "Implementation" },
			},
			q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
				"Workspace Symbols",
			},
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
			f = { "<cmd>lua require('utils/telescope').search_files()<CR>", "Search files" },
			["/"] = { "<cmd>lua require('utils/telescope').search_in_buffer()<CR>", "Search buffer" },
			h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
			M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
			R = { "<cmd>Telescope registers<CR>", "Registers" },
			t = { "<cmd>Telescope live_grep<CR>", "Text" },
			k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
			C = { "<cmd>Telescope commands<CR>", "Commands" },
			p = {
				"<cmd>lua require('utils/telescope').colorscheme({enable_preview = true})<CR>",
				"Colorscheme with Preview",
			},
		},
		T = {
			name = "Treesitter",
			i = { ":TSConfigInfo<CR>", "Info" },
		},
		t = {
			name = "Trouble",
			t = { "<cmd>TroubleToggle<CR>", "Diagnostics" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics" },
			d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document diagnostics" },
			D = { "<cmd>TroubleToggle lsp_definitions<CR>", "LSP definitions" },
			r = { "<cmd>TroubleToggle lsp_references<CR>", "LSP references" },
		},
	},
}

wk.setup(config.setup)
wk.register(config.mappings, config.opts)
wk.register(config.vmappings, config.vopts)
