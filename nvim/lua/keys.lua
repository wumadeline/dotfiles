local map = vim.keymap.set

map("n", "<SPACE>", "<Nop>")

-- GitGutter
map("n", "<Leader>ha", ":GitGutterNextHunk<CR>")
map("n", "<Leader>hb", ":GitGutterPrevHunk<CR>")
map("n", "<Leader>ga", ":GitGutterStageHunk<CR>")
map("n", "<Leader>gu", ":GitGutterUndoHunk<CR>")


-- Goyo
map("n", "<Leader>g", ":Goyo<CR>")


-- NERDCommenter
map("v", "++", "<plug>NERDCommenterToggle<CR>")
map("n", "++", "<plug>NERDCommenterToggle<CR>")


-- NERDTree
map("n", "<C-n>", ":NERDTreeToggle<CR>", { remap = True })


-- Split Navigations
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")


-- Close buffer and jump to previous
map("n", "<C-c>", ":bp|bd #<CR>")


map("", ":Q", ":q")
map("", ":W", ":w")
map("", ":X", ":x")
