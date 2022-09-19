require("globals")
require("general")
require("plugins")
require("mappings").load_defaults()

require("config/bufferline")
require("config/compe")
require("config/dashboard-nvim")
require("config/gitsigns")
require("config/indent-blankline")
require("config/rust-tools")
require("config/lspconfig")
require("config/nvim-autopairs")
require("config/nvim-colorizer")
require("config/nvim-tree")
require("config/nvim-ts-autotag")
require("config/symbols-outline")
require("config/telescope")
require("config/tree-sitter")
require("config/github-colors")
require("config/lsp-trouble")
require("config/which-key")

vim.cmd("colorscheme gruvbox")
require("config/tabby")
require("statusline")

-- vim.cmd("highlight Normal guibg=none ctermbg=none")
-- vim.cmd("highlight NonText guibg=none ctermbg=none")
-- vim.cmd("highlight SignColumn guibg=none ctermbg=none")
-- vim.cmd("highlight CursorLineNR guibg=none ctermbg=none")
-- vim.cmd("highlight VertSplit guibg=none ctermbg=none")
-- vim.cmd("highlight NvimTreeNormal guibg=none ctermbg=none")
-- vim.cmd("highlight NvimTreeNormalNC guibg=none ctermbg=none")
-- vim.opt.guifont='FiraCodeNerdFont'
