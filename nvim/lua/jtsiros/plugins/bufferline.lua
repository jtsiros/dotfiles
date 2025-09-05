return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                numbers = "none", -- can be "none" | "ordinal" | "buffer_id" | "both"
                close_command = "bdelete! %d", -- can be a string | function, see "Mouse commands"
                right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse commands"
                left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse commands"
                middle_mouse_command = nil, -- can be a string | function, see "Mouse commands"
                indicator = {
                    icon = "▎", -- this should be omitted if you use devicons
                    style = "icon",
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
            },
        })
    end,
}
