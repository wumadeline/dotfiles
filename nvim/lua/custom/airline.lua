-- Custom status/tabline
return { "vim-airline/vim-airline",
  lazy = false,
  priority = 1000,
  dependencies = { "vim-airline/vim-airline-themes" },
  config = function()
    vim.g.airline_theme = "catppuccin"
    vim.g["airline#extensions#hunks#non_zero_only"] = 1 -- Display git line diffs from hunks
  end,
}
