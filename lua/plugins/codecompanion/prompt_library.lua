local config = require("plugins.codecompanion.config")

local M = {}

M.prompt_library = {
  -- Custom the default prompt
  ["Generate a Commit Message"] = {
    prompts = {
      {
        role = "user",
        content = function()
          return "Write commit message with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
            .. "\n\n```\n"
            .. vim.fn.system("git diff")
            .. "\n```"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Explain"] = {
    strategy = "chat",
    description = "Explain how code in a buffer works",
    opts = {
      index = 4,
      default_prompt = true,
      mapping = "<LocalLeader>ce",
      modes = { "v" },
      slash_cmd = "explain",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "system",
        content = config.COPILOT_EXPLAIN,
        opts = {
          visible = false,
        },
      },
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please explain how the following code works:\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  -- Add custom prompts
  ["Generate a Commit Message for Staged"] = {
    strategy = "chat",
    description = "Generate a commit message for staged change",
    opts = {
      index = 9,
      mapping = "<LocalLeader>cM",
      slash_cmd = "staged-commit",
      auto_submit = true,
    },
    prompts = {
      {
        role = "user",
        content = function()
          return "Write commit message for the change with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
            .. "\n\n```\n"
            .. vim.fn.system("git diff --staged")
            .. "\n```"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Inline-Document"] = {
    strategy = "inline",
    description = "Add documentation for code.",
    opts = {
      mapping = "<LocalLeader>cd",
      modes = { "v" },
      slash_cmd = "inline-doc",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please provide documentation in comment code for the following code and suggest to have better naming to improve readability.\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Document"] = {
    strategy = "chat",
    description = "Write documentation for code.",
    opts = {
      mapping = "<LocalLeader>cD",
      modes = { "v" },
      slash_cmd = "doc",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please brief how it works and provide documentation in comment code for the following code. Also suggest to have better naming to improve readability.\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Review"] = {
    strategy = "chat",
    description = "Review the provided code snippet.",
    opts = {
      index = 11,
      mapping = "<LocalLeader>cR",
      modes = { "v" },
      slash_cmd = "review",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "system",
        content = config.COPILOT_REVIEW,
        opts = {
          visible = false,
        },
      },
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please review the following code and provide suggestions for improvement then refactor the following code to improve its clarity and readability:\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Refactor"] = {
    strategy = "inline",
    description = "Refactor the provided code snippet.",
    opts = {
      index = 11,
      mapping = "<LocalLeader>cr",
      modes = { "v" },
      slash_cmd = "refactor",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "system",
        content = config.COPILOT_REFACTOR,
        opts = {
          visible = false,
        },
      },
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please refactor the following code to improve its clarity and readability:\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
  ["Naming"] = {
    strategy = "inline",
    description = "Give betting naming for the provided code snippet.",
    opts = {
      index = 12,
      mapping = "<LocalLeader>cn",
      modes = { "v" },
      slash_cmd = "naming",
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = "user",
        content = function(context)
          local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

          return "Please provide better names for the following variables and functions:\n\n```"
            .. context.filetype
            .. "\n"
            .. code
            .. "\n```\n\n"
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
}

return M
