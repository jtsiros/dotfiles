return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "󰠠",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- LSP keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf, silent = true }

        map("n", "gR", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "References" }))
        map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Declaration" }))
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Definitions" }))
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Implementations" }))
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Type definitions" }))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
        map("n", "<leader>x.", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
        map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
        map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
        map("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })

    -- Server configurations using vim.lsp.config (Neovim 0.11+)
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("graphql", {
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    vim.lsp.config("bashls", {
      filetypes = { "sh", "bash", "zsh" },
      settings = {
        bashIde = {
          globPattern = "**/*@(.sh|.inc|.bash|.command|.zsh)",
        },
      },
    })

    vim.lsp.config("zls", {
      cmd = { vim.fn.expand("~/.local/bin/zls") },
    })

    -- Enable all servers
    vim.lsp.enable({
      "gopls",
      "rust_analyzer",
      "zls",
      "lua_ls",
      "graphql",
      "prismals",
      "pyright",
      "bashls",
    })
  end,
}
