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

    mason_lspconfig.setup()

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set diagnostic symbols
    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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
    }

    -- Use setup_handlers if available (newer mason-lspconfig versions)
    if mason_lspconfig.setup_handlers then
      mason_lspconfig.setup_handlers(vim.tbl_extend("force", {
        function(server_name)
          if server_configs[server_name] then
            server_configs[server_name]()
          else
            lspconfig[server_name].setup({ capabilities = capabilities })
          end
        end,
      }, server_configs))
    else
      -- Fallback for older mason-lspconfig
      for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
        if server_configs[server_name] then
          server_configs[server_name]()
        else
          lspconfig[server_name].setup({ capabilities = capabilities })
        end
      end
    end
  end,
}
