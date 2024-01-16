return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "bash",
        "c",
        "dockerfile",
        "json",
        "lua",
        "go",
        "proto",
        "python",
        "markdown",
        "markdown_inline",
        "query",
        "typescript",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
    })
  end
}
