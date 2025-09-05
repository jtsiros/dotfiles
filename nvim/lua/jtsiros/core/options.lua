-- Core Neovim options and settings
-- Optimized for modern development workflow

local opt = vim.opt
local g = vim.g

-- Leader key (must be set before lazy to ensure correct mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- =============================================================================
-- UI Configuration
-- =============================================================================

-- Line numbers
opt.number = true         -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.signcolumn = "yes"    -- always show sign column to prevent text shift

-- Appearance
opt.termguicolors = true -- enable 24-bit RGB colors
opt.background = "dark"  -- default to dark background
opt.cursorline = true    -- highlight current line
opt.wrap = false         -- don't wrap lines
opt.scrolloff = 8        -- keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8    -- keep 8 columns left/right of cursor when scrolling
opt.numberwidth = 4      -- set number column width
opt.showmode = false     -- don't show mode (lualine handles this)
opt.conceallevel = 0     -- show concealed characters

-- =============================================================================
-- Indentation & Tabs
-- =============================================================================

opt.tabstop = 4        -- number of visual spaces per tab
opt.softtabstop = 4    -- number of spaces in tab when editing
opt.shiftwidth = 4     -- number of spaces to use for autoindent
opt.expandtab = true   -- expand tabs to spaces
opt.autoindent = true  -- copy indent from current line when starting new line
opt.smartindent = true -- smart autoindenting when starting new line

-- =============================================================================
-- Search Configuration
-- =============================================================================

opt.hlsearch = true   -- highlight search matches
opt.incsearch = true  -- show search matches as you type
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true  -- override ignorecase if search contains uppercase

-- =============================================================================
-- File Management
-- =============================================================================

opt.swapfile = false -- don't create swap files
opt.backup = false   -- don't create backup files
opt.undofile = true  -- enable persistent undo
opt.updatetime = 250 -- faster completion (4000ms default)
opt.timeoutlen = 300 -- time to wait for mapped sequence to complete (faster key repeat)

-- =============================================================================
-- Editing Behavior
-- =============================================================================

opt.backspace = "indent,eol,start"  -- allow backspace over everything
opt.clipboard:append("unnamedplus") -- use system clipboard
opt.iskeyword:append("-")           -- treat dash separated words as a word text object
opt.mouse = "a"                     -- enable mouse support
opt.whichwrap:append("<,>,[,],h,l") -- allow specified keys to cross line boundaries

-- =============================================================================
-- Window Splitting
-- =============================================================================

opt.splitright = true -- vertical splits go to the right
opt.splitbelow = true -- horizontal splits go below

-- =============================================================================
-- Performance Optimizations
-- =============================================================================

opt.lazyredraw = false -- don't redraw while executing macros (can cause issues)
opt.ttyfast = true     -- indicates fast terminal connection
opt.hidden = true      -- allow hidden buffers

-- =============================================================================
-- Tab Configuration
-- =============================================================================

opt.showtabline = 2 -- always show tabline

-- =============================================================================
-- GUI Configuration (Neovide)
-- =============================================================================

if g.neovide then
    g.neovide_scale_factor = 1.0
    g.neovide_opacity = 0.98 -- Updated from deprecated neovide_transparency

    -- Cursor performance optimizations for faster movement
    g.neovide_cursor_animation_length = 0.05        -- Faster cursor animation (default 0.13)
    g.neovide_cursor_trail_size = 0.1               -- Shorter cursor trail (default 0.8)
    g.neovide_cursor_animate_in_insert_mode = false -- Disable insert mode animation
    g.neovide_cursor_animate_command_line = false   -- Disable command line animation

    opt.guifont = "JetBrainsMono Nerd Font:h16"
end

-- =============================================================================
-- File Explorer (netrw) - Disabled since using nvim-tree
-- =============================================================================

-- Disable netrw (we use nvim-tree instead)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
