-- Core keymaps

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "kj", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Visual mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Centered navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- Number operations
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
map("v", "<leader>+", "<C-a>", { desc = "Increment numbers" })
map("v", "<leader>-", "<C-x>", { desc = "Decrement numbers" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Down window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Up window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "File in new tab" })
map("n", "<A-1>", "<cmd>1tabnext<CR>", { desc = "Go to tab 1" })
map("n", "<A-2>", "<cmd>2tabnext<CR>", { desc = "Go to tab 2" })
map("n", "<A-3>", "<cmd>3tabnext<CR>", { desc = "Go to tab 3" })
map("n", "<A-4>", "<cmd>4tabnext<CR>", { desc = "Go to tab 4" })
map("n", "<A-5>", "<cmd>5tabnext<CR>", { desc = "Go to tab 5" })

-- Theme management
local function toggle_theme()
  local current_colorscheme = vim.g.colors_name
  if current_colorscheme == "catppuccin-mocha" or current_colorscheme == "catppuccin" then
    vim.o.background = "light"
    vim.cmd.colorscheme("github_light_default")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("catppuccin-mocha")
  end
end

map("n", "<leader>tt", toggle_theme, { desc = "Toggle theme" })
map("n", "<leader>td", function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("catppuccin-mocha")
end, { desc = "Dark theme" })
map("n", "<leader>tl", function()
  vim.o.background = "light"
  vim.cmd.colorscheme("github_light_default")
end, { desc = "Light theme" })

-- Configuration
map("n", "<leader>so", "<cmd>source %<CR>", { desc = "Source current file" })
map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
map("n", "<leader>ls", "<cmd>Lazy sync<CR>", { desc = "Lazy sync" })
map("n", "<leader>lu", "<cmd>Lazy update<CR>", { desc = "Lazy update" })
map("n", "<leader>lr", "<cmd>Lazy reload<CR>", { desc = "Lazy reload" })
map("n", "<leader>lp", "<cmd>Lazy profile<CR>", { desc = "Lazy profile" })

-- Directory
map("n", "<leader>cdc", ":cd ", { desc = "Change directory" })
map("n", "<leader>cdf", "<cmd>cd %:h<CR>", { desc = "CD to file dir" })
map("n", "<leader>cdp", "<cmd>pwd<CR>", { desc = "Show directory" })

-- Buffers
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>br", "<cmd>e!<CR>", { desc = "Revert buffer from disk" })

-- Neovide zoom
if vim.g.neovide then
  local function zoom_in() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1 end
  local function zoom_out() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1 end
  local function zoom_reset() vim.g.neovide_scale_factor = 1.0 end
  
  map("n", "<C-=>", zoom_in, { desc = "Zoom in" })
  map("n", "<C-->", zoom_out, { desc = "Zoom out" })
  map("n", "<C-0>", zoom_reset, { desc = "Reset zoom" })
  map("n", "<D-=>", zoom_in, { desc = "Zoom in" })
  map("n", "<D-->", zoom_out, { desc = "Zoom out" })
  map("n", "<D-0>", zoom_reset, { desc = "Reset zoom" })
end
