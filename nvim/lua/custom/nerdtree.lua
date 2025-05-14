return { "scrooloose/nerdtree",
  lazy = false, -- Make sure this is loaded because we open the tree on vim start
  dependencies = { "ryanoasis/vim-devicons" },
  keys = {
    { "<C-n>", ":NERDTreeToggle<CR>", mode = "n", desc = "ctrl+n to toggle NERDTree buffer"}
  },
  config = function()
    vim.g.NERDTreeShowHidden = 1 -- Show hidden files

    -- Define autocmds
    local autocmd = vim.api.nvim_create_autocmd

    -- Autoclose NERDTree if it's the last buffer
    autocmd( "BufEnter", {
      pattern = "*",
      callback = function()
        local NERDTree = vim.b.NERDTree -- Get the buffer variable
        if NERDTree ~= nil and NERDTree._type == "tab" then

          local listed_buffers = vim.fn.getbufinfo({buflisted = 1}) -- Get all listed buffers

          for idx = 1, #listed_buffers do
            local bufnr = listed_buffers[idx].bufnr

            -- Try to get the window associated with the buffer
            local window = vim.fn.bufwinid(bufnr)

            if window ~= -1 then
              -- The buffer has an active window, so we do not want to quit
              do return end
            end
          end

          -- If none of the listed buffers are in the active windows, quit and close the tree
          vim.cmd("quit")
        end
      end
    })
  end
}
