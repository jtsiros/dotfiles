-- Autocommands

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  command = [[%s/\s\+$//e]],
})

-- Auto-reload files when changed externally
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = general,
  command = "if mode() != 'c' | checktime | endif",
})

-- Close certain filetypes with 'q'
autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "notify", "lspinfo", "spectre_panel", "startuptime" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Window management
local windows = augroup("Windows", { clear = true })

autocmd("VimResized", {
  group = windows,
  command = "tabdo wincmd =",
})

autocmd("BufEnter", {
  group = windows,
  command = "set formatoptions-=cro",
})

-- File type settings
local filetypes = augroup("FileTypes", { clear = true })

autocmd("FileType", {
  group = filetypes,
  pattern = { "javascript", "typescript", "json", "html", "css", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

autocmd("FileType", {
  group = filetypes,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

autocmd("FileType", {
  group = filetypes,
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Performance
local performance = augroup("Performance", { clear = true })

autocmd("BufReadPre", {
  group = performance,
  callback = function()
    local max_filesize = 1024 * 1024 -- 1MB
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > max_filesize then
      vim.cmd("syntax off")
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.undolevels = -1
    end
  end,
})

-- LSP
local lsp = augroup("LSP", { clear = true })

autocmd("CursorHold", {
  group = lsp,
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
    })
  end,
})

-- Terminal
local terminal = augroup("Terminal", { clear = true })

autocmd("TermOpen", {
  group = terminal,
  command = "startinsert",
})

autocmd("TermOpen", {
  group = terminal,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- UI Theme refresh
local ui = augroup("UITheme", { clear = true })

autocmd("ColorScheme", {
  group = ui,
  callback = function()
    -- Force bufferline to refresh when colorscheme changes
    vim.defer_fn(function()
      local ok, bufferline_api = pcall(require, "bufferline.api")
      if ok then
        -- Try to refresh bufferline using its internal API
        pcall(function()
          vim.cmd("doautocmd User BufferlineRefresh")
        end)
      end
      -- Force a full redraw as fallback
      vim.cmd("redraw!")
    end, 100)
  end,
})
