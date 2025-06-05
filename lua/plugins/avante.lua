if true then
  return {}
end
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions = false, -- Experimental stage
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      jump_result_buffer_on_finish = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
      enable_token_counting = true,
      enable_cursor_planning_mode = false,
      enable_claude_text_editor_tool_mode = false,
      use_cwd_as_project_root = false,
    },
    -- for example
    file_selector = {
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
      provider = "snacks",
      -- Options override for custom providers
      provider_opts = {},
    },
    provider = "claude",
    windows = {
      ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
      position = "right",
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width in vertical layout
      height = 30, -- default % based on available height in horizontal layout
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the ask window
        ---@alias AvanteInitialDiff "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    mappings = {
      ---@class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      cancel = {
        normal = { "<C-c>", "<Esc>", "q" },
        insert = { "<C-c>" },
      },
      -- NOTE: The following will be safely set by avante.nvim
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      stop = "<leader>aS",
      toggle = {
        default = "<leader>at",
        debug = "<leader>ad",
        hint = "<leader>ah",
        suggestion = "<leader>as",
        repomap = "<leader>aR",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        retry_user_request = "r",
        edit_user_request = "e",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
        remove_file = "d",
        add_file = "@",
        close = { "<Esc>", "q" },
        ---@alias AvanteCloseFromInput { normal: string | nil, insert: string | nil }
        ---@type AvanteCloseFromInput | nil
        close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
      files = {
        add_current = "<leader>ac", -- Add current buffer to selected files
        add_all_buffers = "<leader>aB", -- Add all buffer files to selected files
      },
      select_model = "<leader>a?", -- Select model command
      select_history = "<leader>ah", -- Select history command
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      "saghen/blink.cmp",
      opts = {
        sources = {
          compat = {
            "avante_commands",
            "avante_mentions",
            "avante_files",
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
