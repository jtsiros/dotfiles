-- Autocommands for enhanced Neovim behavior
-- These provide automatic actions and improved user experience

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- =============================================================================
-- General Autocommands
-- =============================================================================

local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  desc = "Remove trailing whitespace on save",
  command = [[%s/\s\+$//e]],
})

-- Auto-reload files when changed externally
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = general,
  desc = "Auto-reload file if changed externally",
  command = "if mode() != 'c' | checktime | endif",
})

-- Automatically close certain filetypes with 'q'
autocmd("FileType", {
  group = general,
  desc = "Close certain filetypes with q",
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- =============================================================================
-- Window and Layout Management
-- =============================================================================

local windows = augroup("Windows", { clear = true })

-- Equalize splits when Vim is resized
autocmd("VimResized", {
  group = windows,
  desc = "Equalize splits on resize",
  command = "tabdo wincmd =",
})

-- Don't auto-insert comments on new lines
autocmd("BufEnter", {
  group = windows,
  desc = "Disable auto-comment on new line",
  command = "set formatoptions-=cro",
})

-- =============================================================================
-- File Type Specific Settings
-- =============================================================================

local filetypes = augroup("FileTypes", { clear = true })

-- Set indentation for specific file types
autocmd("FileType", {
  group = filetypes,
  desc = "Set 2-space indentation for web technologies",
  pattern = { "javascript", "typescript", "json", "html", "css", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Enable spell check for certain file types
autocmd("FileType", {
  group = filetypes,
  desc = "Enable spell check for text files",
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- Set wrap for text files
autocmd("FileType", {
  group = filetypes,
  desc = "Enable text wrapping for text files",
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- =============================================================================
-- Performance Optimizations
-- =============================================================================

local performance = augroup("Performance", { clear = true })

-- Disable syntax highlighting for large files
autocmd("BufReadPre", {
  group = performance,
  desc = "Disable syntax for large files",
  callback = function()
    local max_filesize = 1024 * 1024 -- 1MB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > max_filesize then
      vim.cmd("syntax off")
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.undolevels = -1
    end
  end,
})

-- =============================================================================
-- LSP and Diagnostics
-- =============================================================================

local lsp = augroup("LSP", { clear = true })

-- Show diagnostics in a floating window when hovering over an error
autocmd("CursorHold", {
  group = lsp,
  desc = "Show diagnostics in hover window",
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- =============================================================================
-- Terminal Settings
-- =============================================================================

local terminal = augroup("Terminal", { clear = true })

-- Start terminal in insert mode
autocmd("TermOpen", {
  group = terminal,
  desc = "Start terminal in insert mode",
  command = "startinsert",
})

-- Disable line numbers and sign column in terminal
autocmd("TermOpen", {
  group = terminal,
  desc = "Disable UI elements in terminal",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})
