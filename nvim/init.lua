-- Bootstrap Neovim configuration
-- Author: jtsiros

-- Performance: Enable faster loading
local uv = vim.uv or vim.loop

-- Disable unused providers to avoid warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Core configuration (options, keymaps, autocommands)
local ok, _ = pcall(require, "jtsiros.core")
if not ok then
  vim.notify("Failed to load core configuration", vim.log.levels.ERROR)
end

-- Plugin manager (lazy.nvim)
local ok, _ = pcall(require, "jtsiros.lazy")
if not ok then
  vim.notify("Failed to load lazy.nvim configuration", vim.log.levels.ERROR)
end

-- Colorscheme (with fallback)
vim.cmd.colorscheme("vague")
