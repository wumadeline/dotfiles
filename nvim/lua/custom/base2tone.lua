return {
    -- Duotone syntax higlighting
    "atelierbram/Base2Tone-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme Base2Tone_EarthDark]]) -- Set the colorscheme before lazy loading
    end,
  }
