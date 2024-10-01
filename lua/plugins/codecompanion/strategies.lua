local config = require("plugins.codecompanion.config")

local M = {}

M.strategies = {
  chat = {
    adapter = "copilot",
    roles = { llm = "  Copilot Chat", user = "CodeCompanion" },
    slash_commands = {
      ["buffer"] = {
        callback = "helpers.slash_commands.buffer",
        description = "Insert open buffers",
        opts = {
          contains_code = true,
          provider = "telescope", -- default|telescope|mini_pick|fzf_lua
        },
      },
      ["file"] = {
        callback = "helpers.slash_commands.file",
        description = "Insert a file",
        opts = {
          contains_code = true,
          max_lines = 1000,
          provider = "telescope", -- telescope|mini_pick|fzf_lua
        },
      },
    },
    keymaps = {
      send = {
        modes = {
          n = "<CR>",
          i = "<C-s>",
        },
        index = 1,
        callback = "keymaps.send",
        description = "Send",
      },
      close = {
        modes = {
          n = "q",
        },
        index = 3,
        callback = "keymaps.close",
        description = "Close Chat",
      },
      stop = {
        modes = {
          n = "<C-c>",
        },
        index = 4,
        callback = "keymaps.stop",
        description = "Stop Request",
      },
    },
  },
  inline = { adapter = "copilot" },
  agent = { adapter = "copilot" },
}

M.inline = {
  layout = "buffer", -- vertical|horizontal|buffer
}

M.display = {
  chat = {
    -- Change to true to show the current model
    show_settings = false,
    window = {
      layout = "vertical", -- float|vertical|horizontal|buffer
    },
  },
}

M.opts = {
  log_level = "DEBUG",
  system_prompt = config.SYSTEM_PROMPT,
}

return M
