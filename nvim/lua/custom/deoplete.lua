return { "Shougo/deoplete.nvim",
  lazy = false, -- Make sure this is loaded
  keys = {
    { "<Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
    end, mode = "i", desc = "use TAB for completion", expr = true}
  },
  config = function()
    vim.cmd("call deoplete#enable()")
  end
}
