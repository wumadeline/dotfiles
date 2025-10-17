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
    fzf_lua.setup({
      -- Add additional config here if needed
      winopts = {
        -- Default split layout for FzfLua windows
        height = 0.50,            -- window height
        width = 0.80,            -- window width
        row = 0.35,            -- window row position (0=top, 1=bottom)
        col = 0.50,            -- window col position (0=left, 1=right)
        -- border argument passthrough to nvim_open_win()
        border = "rounded",
        treesitter = {
          enabled = true,
          fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
        },
        preview = {
          keymap = {
            -- Move preview up and down with Ctrl-j, Ctrl-k
            ["<C-j>"] = "preview-page-down",
            ["<C-k>"] = "preview-page-up",
          },
        },
      },
      keymap = {
        builtin = {
          ["<Esc>"] = "abort",
        }
      }
    })
  end,
}
