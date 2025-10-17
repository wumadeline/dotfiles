return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    { "<C-g>", ":1TermExec cmd=\"goose\" name=goose direction=horizontal<CR>" }, -- shortcut for starting a terminal session with goose
    { "<C-t>", ":2ToggleTerm name=term direction=horizontal<CR>" }, -- shortcut for starting another terminal session
  },
  config = function()
    local toggleterm = require("toggleterm")
    local terminal_height = 15 -- Fixed height
    toggleterm.setup({
      size = terminal_height,
      open_mapping = [[<C-\>]],
      direction = "horizontal", -- Default split for the first terminal
      start_in_insert = true,
      persist_size = true, -- prevent the terminal size from changing
    })

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
    end

    -- only use these mappings for toggle term
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    -- Function to resize terminal splits created by toggleterm
    local function resize_terminal()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "toggleterm" then
          vim.api.nvim_win_set_height(win, terminal_height)
        end
      end
    end

    -- Autocommand to resize terminals after window layout changes
    vim.api.nvim_create_autocmd("WinClosed", {
      callback = function()
        resize_terminal()
      end,
    })
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        resize_terminal()
      end,
    })
  end,
}
