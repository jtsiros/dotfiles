-- Core keymaps and shortcuts
-- These are global keymaps that don't depend on plugins

-- Note: Leader key is set in options.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =============================================================================
-- General Mappings
-- =============================================================================

-- Better escape
map("i", "jk", "<ESC>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))
map("i", "kj", "<ESC>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

-- Clear search highlights
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Keep cursor centered during navigation
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- =============================================================================
-- Number Operations
-- =============================================================================

map("n", "<leader>+", "<C-a>", vim.tbl_extend("force", opts, { desc = "Increment number" }))
map("n", "<leader>-", "<C-x>", vim.tbl_extend("force", opts, { desc = "Decrement number" }))
map("v", "<leader>+", "<C-a>", vim.tbl_extend("force", opts, { desc = "Increment numbers" }))
map("v", "<leader>-", "<C-x>", vim.tbl_extend("force", opts, { desc = "Decrement numbers" }))

-- =============================================================================
-- Window Management
-- =============================================================================

-- Splits
map("n", "<leader>sv", "<C-w>v", vim.tbl_extend("force", opts, { desc = "Split window vertically" }))
map("n", "<leader>sh", "<C-w>s", vim.tbl_extend("force", opts, { desc = "Split window horizontally" }))
map("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Make splits equal size" }))
map("n", "<leader>sx", "<cmd>close<CR>", vim.tbl_extend("force", opts, { desc = "Close current split" }))

-- Window navigation (enhanced with tmux navigator)
map("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
map("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to bottom window" }))
map("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to top window" }))
map("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to right window" }))

-- Leader + w navigation (alternative to Ctrl keys)
map("n", "<leader>wh", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to left window" }))
map("n", "<leader>wj", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to bottom window" }))
map("n", "<leader>wk", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to top window" }))
map("n", "<leader>wl", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to right window" }))

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- =============================================================================
-- Tab Management
-- =============================================================================

map("n", "<leader>to", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "Open new tab" }))
map("n", "<leader>tx", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close current tab" }))
map("n", "<leader>tn", "<cmd>tabnext<CR>", vim.tbl_extend("force", opts, { desc = "Go to next tab" }))
map("n", "<leader>tp", "<cmd>tabprevious<CR>", vim.tbl_extend("force", opts, { desc = "Go to previous tab" }))
map("n", "<leader>tf", "<cmd>tabnew %<CR>", vim.tbl_extend("force", opts, { desc = "Open current buffer in new tab" }))

-- Navigate tabs with alt
map("n", "<A-1>", "<cmd>1tabnext<CR>", opts)
map("n", "<A-2>", "<cmd>2tabnext<CR>", opts)
map("n", "<A-3>", "<cmd>3tabnext<CR>", opts)
map("n", "<A-4>", "<cmd>4tabnext<CR>", opts)
map("n", "<A-5>", "<cmd>5tabnext<CR>", opts)

-- =============================================================================
-- Directory Management
-- =============================================================================

-- Change directory group
map("n", "<leader>cdc", ":cd ", { desc = "Change directory" })
map("n", "<leader>cdf", "<cmd>cd %:h<CR>", vim.tbl_extend("force", opts, { desc = "Change to current file's directory" }))
map("n", "<leader>cdp", "<cmd>pwd<CR>", vim.tbl_extend("force", opts, { desc = "Show current directory" }))

-- =============================================================================
-- Buffer Management
-- =============================================================================

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Close buffers
map("n", "<leader>bx", "<cmd>bd<CR>", vim.tbl_extend("force", opts, { desc = "Close current buffer" }))
