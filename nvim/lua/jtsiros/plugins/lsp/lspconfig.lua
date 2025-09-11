return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- Fix position encoding for Neovim 0.11+
    if vim.fn.has('nvim-0.11') == 1 then
      capabilities.general = capabilities.general or {}
      capabilities.general.positionEncodings = { "utf-16", "utf-8" }
      
      -- Suppress position encoding warnings
      local original_notify = vim.notify
      vim.notify = function(msg, level, opts)
        if type(msg) == "string" and msg:match("position_encoding.*required.*Defaulting") then
          return
        end
        return original_notify(msg, level, opts)
      end
    end
    
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

    -- Configure LSP handlers to suppress warnings
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = "rounded",
      }
    )
    
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = "rounded",
      }
    )

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
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Buffer diagnostics" }))
        map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
        map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
        map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
        map("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })

    -- Server configurations
    local servers = {
      graphql = {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
          },
        },
      },
      bashls = {
        filetypes = { "sh", "bash", "zsh" },
        settings = {
          bashIde = {
            globPattern = "**/*@(.sh|.inc|.bash|.command|.zsh)",
          },
        },
      },
    }

    -- Setup servers
    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
    end
    
    -- Default servers
    for _, server in ipairs({ "gopls", "rust_analyzer", "zls", "prismals", "pyright" }) do
      lspconfig[server].setup({ capabilities = capabilities })
    end
  end,
}
