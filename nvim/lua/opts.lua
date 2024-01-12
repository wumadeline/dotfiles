local opt = vim.opt
local cmd = vim.cmd

-- Base2Tone
opt.background = dark  -- Use dark background
cmd("syntax enable")
cmd("colorscheme OceanicNext") -- Use oceanic next theme


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
opt.autoindent = true -- Automatically indent next line
opt.smartindent = true -- Automatically insert extra level of indentation
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.softtabstop = 4 -- 1 tab == 4 spaces


-- Splits
opt.splitbelow = true -- All horizontal splits open to the bottom
opt.splitright = true -- All vertical splits open to the right
