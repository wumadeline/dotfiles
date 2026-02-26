return {
  "andythigpen/nvim-coverage",
  config = function()
    local coverage = require("coverage")
    coverage.setup({
      auto_reload = true,
      lang = {
        golang = {
          coverage_file = function()
            local filename= "coverage.out"
            return vim.fs.joinpath(vim.fs.root(0, filename) or ".", filename)
          end,
        },
      },
    })
  end,
}
