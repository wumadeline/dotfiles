return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- language specific dependencies
     { "fredrikaverpil/neotest-golang", version = "*" },
  },
  keys = {
    { "<leader>rt", function() require("neotest").run.run() end, desc = "run nearest test" },
    { "<leader>rtf", function() require("neotest").run.run(vim.fn.expand('%')) end, desc = "run tests in file" },
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    local neotest = require("neotest")
    -- Specify adapter configurations
    local neotest_golang_opts = {
      testify_enabled = true,
    }
    neotest.setup({
      adapters = {
        require("neotest-golang")(neotest_golang_opts)
      }
    })
  end,
}
