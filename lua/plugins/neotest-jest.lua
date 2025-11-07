---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
  commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      discovery = {
        enabled = false,
      },
      adapters = {
        require("neotest-jest")({
          jestCommand = "yarn test --",
          jest_test_discovery = true,
          env = { CI = true },
        }),
      },
    })
  end,
}
