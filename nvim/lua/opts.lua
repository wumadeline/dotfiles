local opt = vim.opt
local cmd = vim.cmd

-- Base2Tone
opt.background = dark  -- Use dark background
cmd("colorscheme Base2Tone_EarthDark") -- Dark brown-orange DuoTone syntax theme


-- GitGutter
opt.updatetime = 250 -- Update sign column every quarter section (250 ms)


-- Visual and Formatting
opt.encoding = "utf-8" -- Use UTF-8, needed for Python for GUI colors
opt.number = true -- Show line numbers on the left side
opt.showmatch = true -- Show matching brackets
opt.formatoptions = opt.formatoptions + "o" -- Continue comment marker in new lines
opt.textwidth = 0 -- Hard-wrap long lines as you type them
opt.termguicolors = true -- enable full GUI colors


-- Search
opt.ignorecase = true -- Case insensitive search
opt.incsearch = true -- Type-ahead find
opt.hlsearch = true -- Highlight search results
opt.smartcase = true -- Smart case search


-- Formatting
opt.colorcolumn = "80" -- Display ruler to indicate max line length
opt.expandtab = true -- Use spaces instead of tabs


-- Splits
opt.splitbelow = true -- All horizontal splits open to the bottom
opt.splitright = true -- All vertical splits open to the right
