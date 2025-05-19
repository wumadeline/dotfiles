-- Plugin for FZF-based commands
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "junegunn/fzf",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {"<C-p>", ":FzfLua files<CR>", mode = "n", desc = "Search Files"},
    {"<C-o>", ":FzfLua buffers<CR>", mode = "n", desc = "Search Buffers"},
    {"<C-f>", ":FzfLua grep_project<CR>", mode = "n", desc = "Global search (ripgrep)"},
  },
  config = function()
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({'fzf-vim'})
  end,
}
