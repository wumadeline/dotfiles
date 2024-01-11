local g = vim.g

-- GitGutter
g.gitgutter_enabled = 1 -- Always enable GitGutter
g.gitgutter_highlight_lines = 0 -- Turn off line highlighting
g.gitgutter_set_sign_backgrounds = 1 -- Use GitGutter's background colors

local highlight = vim.cmd.highlight

-- Theme's default values match the background, which messes with the preview
-- window visibility. Change the background value to a different shade.
highlight({"DiffAdded", "guifg=#736d5e guibg=#3f3a37 ctermfg=242 ctermbg=237"})
highlight({"DiffChanged", "guifg=#e6b84d guibg=#3f3a37 ctermfg=178 ctermbg=237"})
highlight({"DiffRemoved", "guifg=#6f5849 guibg=#3f3a37 ctermfg=59 ctermbg=237"})

highlight({"SignColumn", "NONE"})
highlight({"link", "SignColumn", "Normal"})


-- NERDTree
g.NERDTreeShowHidden = 1 -- Show hidden files


-- Enable full GUI Colors
g["&t_8f"] = "<Esc>[38;2;%lu;%lu;%lum"
g["&t_8b"] = "<Esc>[48;2;%lu;%lu;%lum"

