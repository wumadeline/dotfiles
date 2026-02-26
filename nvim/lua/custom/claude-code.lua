local toggle_key = "<C-,>"
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<C-,>", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
      { "<C-,>", "<C-\\><C-n>", desc = "Exit Claude while thinking", mode = { "t" } },
    },
    opts = {
      terminal = {
        ---@module "snacks"
        ---@type snacks.win.Config|{}
        snacks_win_opts = {
          position = "bottom",
          width = 0.9,
          height = 0.25,
          keys = {
            claude_toggle_ctrl = {"<C-,>", function(self) self:toggle() end, mode = "n", desc = "Toggle Claude Code"},
          },
        },
      },
    },
  },
}
