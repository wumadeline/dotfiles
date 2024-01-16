vim.g.mapleader = " " -- Use space as the leader key

-- [[ Plugins ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("custom")
require("keys")
require("opts")
require("vars")
require("autocmds")


-- Prevents neovim from removing all newlines when EditorConfig `insert_final_newline` is false
-- https://github.com/neovim/neovim/issues/21648
require("editorconfig").properties.insert_final_newline = function(bufnr, val, opts)
  vim.b[bufnr].insert_final_newline = nil
end
