return {
  "nvim-orgmode/orgmode",
  dependencies = {
    "nvim-orgmode/org-bullets.nvim",
    "Saghen/blink.cmp",
  },
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup org bullets for better visual representation
    require("org-bullets").setup()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/notes.org",
      org_agenda_custom_commands = {
        -- "c" is the shortcut that will be used in the prompt
        c = {
          description = "Combined view", -- Description shown in the prompt for the shortcut
          types = {
            {
              type = "tags_todo", -- Type can be agenda | tags | tags_todo
              match = '+TODO="NEXT"+PRIORITY="A"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = "High priority todos",
              org_agenda_todo_ignore_deadlines = "far", -- Ignore all deadlines that are too far in future (over org_deadline_warning_days). Possible values: all | near | far | past | future
            },
            {
              type = "tags_todo", -- Type can be agenda | tags | tags_todo
              match = '+TODO="WAITING"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = "Problems & Blockers",
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "My daily agenda",
              org_agenda_span = "day", -- can be any value as org_agenda_span
            },
            {
              type = "tags",
              match = "work", --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = "My work todos",
              org_agenda_todo_ignore_scheduled = "all", -- Ignore all headlines that are scheduled. Possible values: past | future | all
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "Whole week overview",
              org_agenda_span = "week", -- 'week' is default, so it's not necessary here, just an example
              org_agenda_start_on_weekday = 1, -- Start on Monday
              org_agenda_remove_tags = true, -- Do not show tags only for this view
            },
          },
        },
        p = {
          description = "Personal agenda",
          types = {
            {
              type = "tags_todo",
              org_agenda_overriding_header = "My personal todos",
              org_agenda_category_filter_preset = "refile", -- Show only headlines from `todos` category. Same value providad as when pressing `/` in the Agenda view
              org_agenda_sorting_strategy = { "todo-state-up", "priority-down" }, -- See all options available on org_agenda_sorting_strategy
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "Personal projects agenda",
              org_agenda_files = { "~/my-projects/**/*" }, -- Can define files outside of the default org_agenda_files
            },
            {
              type = "tags",
              org_agenda_overriding_header = "Personal projects notes",
              org_agenda_files = { "~/my-projects/**/*" },
              org_agenda_tag_filter_preset = "NOTES-REFACTOR", -- Show only headlines with NOTES tag that does not have a REFACTOR tag. Same value providad as when pressing `/` in the Agenda view
            },
          },
        },
      },
      org_capture_templates = {
        t = {
          description = "TODO",
          template = "* TODO [#B] %?",
          target = "~/orgfiles/todos.org",
        },
        m = {
          description = "Meeting",
          template = "* %? :meeting: \n:Created: %T\n** Attendees\n- \n** Notes\n** Action Items\n*** TODO [#A] ",
          target = "~/orgfiles/meetings.org",
        },
        j = {
          description = "Journal",
          template = "* %U\n\n%?",
          target = "~/orgfiles/journal/%<%Y-%m-%d>.org",
        },
      },
      ui = {
        input = {
          use_vim_ui = true,
        },
        menu = {
          handler = function(data)
            -- your handler here, for example:
            local options = {}
            local options_by_label = {}

            for _, item in ipairs(data.items) do
              -- Only MenuOption has `key`
              -- Also we don't need `Quit` option because we can close the menu with ESC
              if item.key and item.label:lower() ~= "quit" then
                table.insert(options, item.label)
                options_by_label[item.label] = item
              end
            end

            local handler = function(choice)
              if not choice then
                return
              end

              local option = options_by_label[choice]
              if option.action then
                option.action()
              end
            end

            vim.ui.select(options, {
              propmt = data.propmt,
            }, handler)
          end,
        },
      },
      org_todo_keywords = {
        "TODO(t)",
        "NEXT(n)",
        "WAITING(w)",
        "SOMEDAY(s)",
        "|",
        "DONE(d)",
        "CANCELLED(c)",
      },
      org_todo_keyword_faces = {
        TODO = ":foreground #f38ba8 :weight bold",
        NEXT = ":foreground #89b4fa :weight bold",
        WAITING = ":foreground #f9e2af :weight bold",
        SOMEDAY = ":foreground #b4befe :weight bold",
        DONE = ":foreground #a6e3a1 :weight bold",
        CANCELLED = ":foreground #7f849c :weight bold",
      },
      win_split_mode = "vertical",
      org_hide_emphasis_markers = true,
      org_startup_indented = true,
      org_note_finalize = "<C-m>",
      mappings = {
        org = {
          -- providing a string
          org_priority = "<Leader>op",
        },
      },
    })
    require("blink.cmp").setup({
      sources = {
        per_filetype = {
          org = { "orgmode" },
        },
        providers = {
          orgmode = {
            name = "Orgmode",
            module = "orgmode.org.autocompletion.blink",
            fallbacks = { "buffer" },
          },
        },
      },
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
