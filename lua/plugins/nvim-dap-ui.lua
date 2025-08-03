return {
  -- Plugin configuration for nvim-dap-ui, a UI layer for the Neovim debugger (DAP)
  "rcarriga/nvim-dap-ui",

  -- Dependencies: requires nvim-dap for core debugging functionality and nvim-nio for async IO
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

  -- Configuration options for the UI layout and behavior
  opts = {
    -- Icon mappings for tree view elements (expanded/collapsed states)
    icons = { expanded = "", collapsed = "", current_frame = "" },

    -- Keymap bindings for UI interactions
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" }, -- Expand/collapse elements with Enter or mouse click
      open = "o", -- Open selected element
      remove = "d", -- Remove breakpoint/watch
      edit = "e", -- Edit variable/value
      repl = "r", -- Open REPL panel
      toggle = "t", -- Toggle visibility of elements
    },

    -- Custom keymaps for specific UI elements (currently empty)
    element_mappings = {},

    -- Enable line expansion for Neovim 0.7+ to improve UI rendering
    expand_lines = vim.fn.has("nvim-0.7") == 1,

    -- Force buffer creation even when not active, ensuring UI stays consistent
    force_buffers = true,

    -- Define layout configuration for the debug UI panels
    layouts = {
      -- Left sidebar: breakpoints, stacks, and watches (33%, 34%, 33%)
      {
        elements = {
          { id = "breakpoints", size = 0.33 },
          { id = "stacks", size = 0.34 },
          { id = "watches", size = 0.33 },
        },
        size = 35, -- Fixed width in characters
        position = "left", -- Position the panel on the left side
      },
      -- Bottom panel: REPL and scopes (10 lines height)
      {
        elements = { "repl", "scopes" },
        size = 10, -- Fixed height in lines
        position = "bottom", -- Position the panel at the bottom
      },
    },

    -- Floating window settings for modals and popups
    floating = {
      max_height = nil, -- No maximum height constraint
      max_width = nil, -- No maximum width constraint
      border = "single", -- Use single-line border
      mappings = {
        ["close"] = { "q", "<Esc>" }, -- Close floating window with Q or Escape
      },
    },

    -- Debug controls (play/pause, step over/into/out) with icons
    controls = {
      enabled = vim.fn.exists("+winbar") == 1, -- Enable only if winbar is available
      element = "repl", -- Default control panel to show
      icons = {
        pause = "", -- Pause icon
        play = "", -- Play icon
        step_into = "", -- Step into icon
        step_over = "", -- Step over icon
        step_out = "", -- Step out icon
        step_back = "", -- Step back icon (undo last step)
        run_last = "", -- Run last command
        terminate = "", -- Terminate debug session
        disconnect = "", -- Disconnect from debugger
      },
    },

    -- Rendering settings for variable values and types
    render = {
      max_type_length = nil, -- No limit on type name length
      max_value_lines = 100, -- Limit displayed lines of values to avoid overflow
      indent = 1, -- Indentation level for nested structures
    },
  },
}
