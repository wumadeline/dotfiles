-- Custom status/tabline
return { "vim-airline/vim-airline",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.airline_theme = "oceanicnext"
    vim.g["airline#extensions#hunks#non_zero_only"] = 1 -- Display git line diffs from hunks
  end,
}
