-- Plugin for FZF-based commands
return { "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  keys = {
    {"<C-p>", ":Files<CR>", mode = "n", desc = "Search Files"},
    {"<C-o>", ":Buffers<CR>", mode = "n", desc = "Search Buffers"},
    {"<C-f>", ":Rg<CR>", mode = "n", desc = "Global search (ripgrep)"},
  },
  config = function()
    vim.opt.rtp = vim.opt.rtp + "/opt/homebrew/bin/fzf"
  end
}
