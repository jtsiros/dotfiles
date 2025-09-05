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
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Don't call mason_lspconfig.setup() here - it's done in mason.lua

    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- Fix position encoding warnings for Neovim 0.11+
    if vim.fn.has('nvim-0.11') == 1 then
      capabilities.general = capabilities.general or {}
      capabilities.general.positionEncodings = { "utf-16", "utf-8" }
      
      -- Suppress specific position encoding warning messages
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
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Set diagnostic symbols
    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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

    -- Attach keymaps on LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        local keymap = vim.keymap
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "LSP references", unpack(opts) })
        keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP definitions", unpack(opts) })
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP implementations", unpack(opts) })
        keymap.set(
          "n",
          "gt",
          "<cmd>Telescope lsp_type_definitions<CR>",
          { desc = "LSP type definitions", unpack(opts) }
        )
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", unpack(opts) })
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
        keymap.set(
          "n",
          "<leader>D",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          { desc = "Buffer diagnostics", unpack(opts) }
        )
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics", unpack(opts) })
        keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic", unpack(opts) })
        keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", unpack(opts) })
        keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", unpack(opts) })
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", unpack(opts) })
      end,
    })

    -- Define server-specific settings
    local server_configs = {
      graphql = function()
        lspconfig.graphql.setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      lua_ls = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,
      bashls = function()
        lspconfig.bashls.setup({
          capabilities = capabilities,
          filetypes = { "sh", "bash", "zsh" },
          settings = {
            bashIde = {
              globPattern = "**/*@(.sh|.inc|.bash|.command|.zsh)",
            },
          },
        })
      end,
    }

    -- Set up all LSP servers explicitly
    -- This ensures they are always configured properly
    
    -- Configure servers with custom settings
    server_configs.graphql()
    server_configs.lua_ls()
    server_configs.bashls()
    
    -- Configure remaining servers with default settings
    local default_servers = { "gopls", "rust_analyzer", "zls", "prismals", "pyright" }
    
    for _, server_name in ipairs(default_servers) do
      lspconfig[server_name].setup({ capabilities = capabilities })
    end
  end,
}
