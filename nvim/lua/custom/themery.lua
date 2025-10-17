return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {"OceanicNext",  "catppuccin"},
      livePreview = true, -- Apply theme while picking
    })
  end
}
