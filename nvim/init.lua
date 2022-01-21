require("globals")
require("general")
require("mappings")
require("plugins")
require("statusline")

require("config/bufferline")
require("config/compe")
require("config/dashboard-nvim")
require("config/gitsigns")
require("config/indent-blankline")
require("config/lspconfig")
require("config/nvim-autopairs")
require("config/nvim-colorizer")
require("config/nvim-tree")
require("config/nvim-ts-autotag")
require("config/rust-tools")
require("config/symbols-outline")
require("config/telescope")
require("config/tree-sitter")
require("config/gopls")
require("config/neorg")
require("config/github_scheme")

vim.cmd("colorscheme github_*")
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
-- vim.opt.guifont='FiraCodeNerdFont'
