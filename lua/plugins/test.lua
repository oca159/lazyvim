return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "yarn test",
            jestConfigFile = function(file)
              if string.find(file, "/modules/") then
                return string.match(file, "(.-/[^/]+/src/modules/.-/)") .. "jest.config.js"
              end

              return vim.fn.getcwd() .. "/jest.config.js"
            end,
            env = { CI = true },
            cwd = function(file)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
