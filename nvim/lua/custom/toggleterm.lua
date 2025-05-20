return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    { "<C-g>", ":1TermExec cmd=\"goose\" name=goose direction=horizontal<CR>" }, -- shortcut for starting a terminal session with goose
    { "<C-t>", ":2ToggleTerm name=term direction=horizontal<CR>" }, -- shortcut for starting another terminal session
  },
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      open_mapping = [[<C-\>]],
      start_in_insert = true,
    })

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
    end

    -- only use these mappings for toggle term
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
  end,
}
