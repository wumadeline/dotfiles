return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "macchiato",
    })
  end,
}
