-- Minimal, centered sessions
return { "junegunn/goyo.vim",
  config = function()
    local map = vim.keymap.set

    map("n", "<Leader>g", ":Goyo<CR>")
  end
}
