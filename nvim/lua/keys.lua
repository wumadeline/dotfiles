local map = vim.keymap.set

map("n", "<SPACE>", "<Nop>")

-- NERDCommenter
map("v", "++", "<plug>NERDCommenterToggle<CR>")
map("n", "++", "<plug>NERDCommenterToggle<CR>")



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
