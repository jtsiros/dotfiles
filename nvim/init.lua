-- Bootstrap Neovim configuration
-- Author: jtsiros

-- Performance: Enable faster loading
local uv = vim.uv or vim.loop

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
