-- Neovim configuration - jtsiros

-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Load core configuration
require("jtsiros.core")

-- Load plugin manager
require("jtsiros.lazy")

-- Set colorscheme
-- Toggle: <leader>tt | Dark: <leader>td | Light: <leader>tl
pcall(vim.cmd.colorscheme, "catppuccin-mocha")
