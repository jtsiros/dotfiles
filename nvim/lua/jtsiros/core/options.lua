-- Neovim options configuration

local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = " "
g.maplocalleader = "\\"

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.wrap = true
opt.linebreak = true      -- Break lines at word boundaries
opt.breakindent = true    -- Maintain indentation on wrapped lines
opt.scrolloff = 8
opt.sidescrolloff = 0     -- Disable horizontal scroll padding
opt.sidescroll = 0        -- Disable horizontal scrolling
opt.numberwidth = 4
opt.showmode = false
opt.conceallevel = 0
opt.showtabline = 2

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- Editing
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")
opt.mouse = "a"
opt.whichwrap:append("<,>,[,],h,l")

-- Windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.lazyredraw = false
opt.ttyfast = true
opt.hidden = true

-- Neovide GUI
if g.neovide then
  g.neovide_scale_factor = 1.0
  g.neovide_opacity = 0.98
  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.1
  g.neovide_cursor_animate_in_insert_mode = false
  g.neovide_cursor_animate_command_line = false
  opt.guifont = "JetBrainsMono Nerd Font:h16"
end

-- Disable netrw (using nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
