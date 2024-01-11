return {
  -- Aesthetics
  {
      -- Custom status/tabline
      "vim-airline/vim-airline",
      lazy = false,
      priority = 1000,
      config = function()
          vim.g.airline_theme = "Base2Tone_EarthDark" -- Set Airline theme to match Base2Tone editor theme
          vim.g["airline#extensions#hunks#non_zero_only"] = 1 -- Display git line diffs from hunks
      end,
  },
  {
    -- Duotone syntax higlighting
    "atelierbram/Base2Tone-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme Base2Tone_EarthDark]]) -- Set the colorscheme before lazy loading
    end,
  },
  "ap/vim-css-color", -- Preview hex colors directly in source code
  "blueyed/vim-diminactive", -- Dim inactive windows
  "junegunn/goyo.vim", -- Minimal, centered sessions
  "junegunn/limelight.vim", -- Focused editing that dims surrounding text

  -- NERDTree
  "scrooloose/nerdtree", -- File tree explorer
  "Xuyuanp/nerdtree-git-plugin", -- Shows git status flags
  "ryanoasis/vim-devicons", -- Adds filetype-specific icons

  -- Functionalities
  "airblade/vim-gitgutter", -- Show diff markers
  "jiangmiao/auto-pairs", -- Inserts/deletes brackets, parens, quotes in pairs
  "scrooloose/nerdcommenter", -- Plugin for easy commenting
  "tpope/vim-sensible", -- Universal set of vim defaults
}
