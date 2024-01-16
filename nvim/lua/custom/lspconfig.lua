return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr) -- only run these when an LSP is available
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show documentation for what is under the cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.definition, opts)

      opts.desc = "Go to definition"
      keymap.set("n", "gd", vim.lsp.buf.definition, opts)

      opts.desc = "List implementations"
      keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

      opts.desc = "List references"
      keymap.set("n", "gr", vim.lsp.buf.references, opts)

      opts.desc = "Display signature information"
      keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

      opts.desc = "Rename"
      keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    end

    -- used to enable autocompletion
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- configure servers --
    -- configure gopls
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure pyright
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua_ls
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- config bufls
    lspconfig["bufls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
