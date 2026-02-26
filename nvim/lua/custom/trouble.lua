return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>tt", "<CMD>Trouble diagnostics toggle<CR>", mode = "n", desc = "Leader+tt to toggle Trouble buffer" }
  }
}
