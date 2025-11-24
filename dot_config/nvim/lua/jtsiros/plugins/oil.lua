return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")

    oil.setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,
      -- Columns to display in the oil buffer
      columns = {
        "icon",
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      -- Send deleted files to the trash instead of permanently deleting them
      delete_to_trash = true,
      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = false,
      -- Keymaps in oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          -- sort order can be "asc" or "desc"
          { "type", "asc" },
          { "name", "asc" },
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>dd", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    keymap.set("n", "<leader>df", function()
      require("oil").open(vim.fn.expand("%:p:h"))
    end, { desc = "Open directory of current file" })
    keymap.set("n", "<leader>dc", "<cmd>Oil --float<CR>", { desc = "Open parent directory in floating window" })
    keymap.set("n", "<leader>dh", function()
      require("oil").toggle_hidden()
    end, { desc = "Toggle hidden files" })
  end,
}
