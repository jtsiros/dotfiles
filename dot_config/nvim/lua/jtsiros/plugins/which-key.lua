return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "modern",
    -- Disable automatic key detection to avoid conflicts
    plugins = {
      marks = false,
      registers = false,
      spelling = false,
      presets = {
        operators = false, -- This should prevent 'd' from showing as delete
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    spec = {
      {
        "<leader>+",
        desc = "Increment number",
      },
      {
        "<leader>-",
        desc = "Decrement number",
      },
      {
        "<leader>n",
        group = "NoHL/Next/New",
      },
      {
        "<leader>nh",
        desc = "Clear search highlights",
      },
      {
        "<leader>na",
        desc = "Swap parameter with next",
      },
      {
        "<leader>nm",
        desc = "Swap function with next",
      },
      {
        "<leader>n:",
        desc = "Swap property with next",
      },
      {
        "<leader>p",
        group = "Previous/Swap Previous",
      },
      {
        "<leader>pa",
        desc = "Swap parameter with previous",
      },
      {
        "<leader>pm",
        desc = "Swap function with previous",
      },
      {
        "<leader>p:",
        desc = "Swap property with previous",
      },
      {
        "<leader>s",
        group = "Splits",
      },
      {
        "<leader>sv",
        desc = "Split window vertically",
      },
      {
        "<leader>sh",
        desc = "Split window horizontally",
      },
      {
        "<leader>se",
        desc = "Make splits equal size",
      },
      {
        "<leader>sx",
        desc = "Close current split",
      },
      {
        "<leader>t",
        group = "Tabs",
      },
      {
        "<leader>to",
        desc = "Open new tab",
      },
      {
        "<leader>tx",
        desc = "Close current tab",
      },
      {
        "<leader>tn",
        desc = "Go to next tab",
      },
      {
        "<leader>tp",
        desc = "Go to previous tab",
      },
      {
        "<leader>tf",
        desc = "Open current buffer in new tab",
      },
      {
        "<leader>g",
        group = "Git",
      },
      {
        "<leader>gg",
        desc = "Open lazy git",
      },
      {
        "<leader>f",
        group = "Find",
      },
      {
        "<leader>ff",
        desc = "Fuzzy find files in cwd",
      },
      {
        "<leader>fr",
        desc = "Fuzzy find recent files",
      },
      {
        "<leader>fs",
        desc = "Find string in cwd",
      },
      {
        "<leader>fc",
        desc = "Find string under cursor in cwd",
      },
      {
        "<leader>ft",
        desc = "Find todos",
      },
      {
        "<leader>fb",
        desc = "Find open buffers",
      },
      {
        "<leader>fh",
        desc = "Find help",
      },
      {
        "<leader>fk",
        desc = "Find keymaps",
      },
      {
        "<leader>fm",
        desc = "Find marks",
      },
      {
        "<leader>h",
        group = "Git Hunks",
      },
      {
        "<leader>hs",
        desc = "Stage hunk",
      },
      {
        "<leader>hr",
        desc = "Reset hunk",
      },
      {
        "<leader>hS",
        desc = "Stage buffer",
      },
      {
        "<leader>hR",
        desc = "Reset buffer",
      },
      {
        "<leader>hu",
        desc = "Undo stage hunk",
      },
      {
        "<leader>hp",
        desc = "Preview hunk",
      },
      {
        "<leader>hb",
        desc = "Blame line",
      },
      {
        "<leader>hB",
        desc = "Toggle line blame",
      },
      {
        "<leader>hd",
        desc = "Diff this",
      },
      {
        "<leader>hD",
        desc = "Diff this ~",
      },
      {
        "<leader>w",
        group = "Window/Workspace",
      },
      {
        "<leader>wh",
        desc = "Move to left window",
      },
      {
        "<leader>wj",
        desc = "Move to bottom window",
      },
      {
        "<leader>wk",
        desc = "Move to top window",
      },
      {
        "<leader>wl",
        desc = "Move to right window",
      },
      {
        "<leader>wr",
        desc = "Restore session for cwd",
      },
      {
        "<leader>ws",
        desc = "Save session for auto session root dir",
      },
      {
        "<leader>m",
        group = "Format/Maximize",
      },
      {
        "<leader>mp",
        desc = "Format file or range (in visual mode)",
      },
      {
        "<leader>o",
        group = "Org",
      },
      {
        "<leader>oa",
        desc = "Org agenda",
      },
      {
        "<leader>oc",
        desc = "Org capture",
      },
      {
        "<leader>of",
        desc = "Find org files",
      },
      {
        "<leader>og",
        desc = "Grep in org files",
      },
      {
        "<leader>l",
        desc = "Trigger linting for current file",
      },
      {
        "<leader>c",
        group = "Code",
      },
      {
        "<leader>ca",
        desc = "Code actions",
      },
      {
        "<leader>cd",
        group = "Change Directory",
      },
      {
        "<leader>cdc",
        desc = "Change directory",
      },
      {
        "<leader>cdf",
        desc = "Change to current file's directory",
      },
      {
        "<leader>cdp",
        desc = "Show current directory",
      },
      {
        "<leader>r",
        group = "Rename/Restart",
      },
      {
        "<leader>rn",
        desc = "Rename symbol",
      },
      {
        "<leader>rs",
        desc = "Restart LSP",
      },
      {
        "<leader>d",
        group = "Directory",
      },
      {
        "<leader>dd",
        desc = "Open parent directory",
      },
      {
        "<leader>df",
        desc = "Open directory of current file",
      },
      {
        "<leader>dc",
        desc = "Open parent directory in floating window",
      },
      {
        "<leader>dh",
        desc = "Toggle hidden files",
      },
      {
        "<leader>b",
        group = "Buffer",
      },
      {
        "<leader>bx",
        desc = "Close current buffer",
      },
      {
        "<leader>x",
        group = "Trouble/Diagnostics",
      },
      {
        "<leader>x.",
        desc = "Show line diagnostics",
      },
      {
        "<leader>xw",
        desc = "Open trouble workspace diagnostics",
      },
      {
        "<leader>xd",
        desc = "Open trouble document diagnostics",
      },
      {
        "<leader>xq",
        desc = "Open trouble quickfix list",
      },
      {
        "<leader>xl",
        desc = "Open trouble location list",
      },
      {
        "<leader>xt",
        desc = "Open todos in trouble",
      },
    },
  },
}
