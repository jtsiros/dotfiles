-----------------------
-- gopls language server 
-----------------------

lspconfig = require "lspconfig"
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          nilness = true,
          shadow = true,
        },
        staticcheck = true,
        usePlaceholders = true,
        gofumpt = true,
      },
    },
}
