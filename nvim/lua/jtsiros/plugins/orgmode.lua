return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      -- Org agenda files
      org_agenda_files = { "~/Org/**/*" },
      -- Default notes file
      org_default_notes_file = "~/Org/refile.org",
      
      -- Agenda configuration
      org_agenda_start_day = "-2d", -- Show 2 days before today
      org_agenda_span = 7, -- Show 7 days total in agenda
      org_agenda_skip_scheduled_if_done = false,
      org_agenda_skip_deadline_if_done = true,
      
      -- Todo keywords
      org_todo_keywords = { "TODO", "NEXT", "|", "DONE", "CANCELLED" },
      
      -- Priority symbols
      org_priority_highest = "A",
      org_priority_default = "B",
      org_priority_lowest = "C",
      
      -- Tags
      org_tags_column = 0, -- Auto-align tags
      
      -- Capture templates
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n  SCHEDULED: %t",
          target = "~/Org/tasks.org",
        },
        n = {
          description = "Note",
          template = "* %? :NOTE:\n  %U",
          target = "~/Org/notes.org",
        },
        j = {
          description = "Journal",
          template = "* %U %?\n",
          target = "~/Org/journal.org",
        },
        m = {
          description = "Meeting",
          template = "* %? :MEETING:\n  %U\n** Attendees\n** Notes\n** Action Items",
          target = "~/Org/meetings.org",
        },
      },
      
      -- Calendar settings
      org_deadline_warning_days = 14,
      org_agenda_span_to_deadline = false,
      
      -- Export settings
      org_export_html_postamble = false,
      
      -- Code block settings
      org_src_window_setup = "current",
      
      -- Appearance settings  
      org_hide_emphasis_markers = false,
      org_hide_leading_stars = false,
      org_adapt_indentation = true,
      
      -- Log settings
      org_log_done = "time", -- Log timestamp when marking DONE
      org_log_repeat = "time", -- Log timestamp for repeated tasks
    })

    -- Additional keymaps for orgmode
    vim.keymap.set("n", "<leader>oa", "<cmd>lua require('orgmode').action('agenda.prompt')<CR>", 
      { desc = "Org agenda" })
    vim.keymap.set("n", "<leader>oc", "<cmd>lua require('orgmode').action('capture.prompt')<CR>", 
      { desc = "Org capture" })
    vim.keymap.set("n", "<leader>of", "<cmd>lua require('telescope.builtin').find_files({search_dirs={'~/Org'}})<CR>", 
      { desc = "Find org files" })
    vim.keymap.set("n", "<leader>og", "<cmd>lua require('telescope.builtin').live_grep({search_dirs={'~/Org'}})<CR>", 
      { desc = "Grep in org files" })
  end,
}
