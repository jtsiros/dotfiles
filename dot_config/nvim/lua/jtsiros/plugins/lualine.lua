return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    -- configure lualine with modified theme
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "",
        section_separators = "",
      },
    })
  end,
}
