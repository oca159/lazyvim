---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
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
