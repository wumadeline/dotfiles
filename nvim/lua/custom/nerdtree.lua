return { "scrooloose/nerdtree",
  dependencies = { "ryanoasis/vim-devicons" },
  keys = {
    { "<C-n>", ":NERDTreeToggle<CR>", mode = "n", desc = "ctrl+n to toggle NERDTree buffer"}
  },
  config = function()
    vim.g.NERDTreeShowHidden = 1 -- Show hidden files
  end
}
