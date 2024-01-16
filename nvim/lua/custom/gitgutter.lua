return { "airblade/vim-gitgutter",
  config = function()
    vim.g.gitgutter_enabled = 1 -- Always enable GitGutter

    -- maps
    local map = vim.keymap.set

    map("n", "<Leader>ha", ":GitGutterNextHunk<CR>")
    map("n", "<Leader>hb", ":GitGutterPrevHunk<CR>")
    map("n", "<Leader>ga", ":GitGutterStageHunk<CR>")
    map("n", "<Leader>gu", ":GitGutterUndoHunk<CR>")

  end
}
