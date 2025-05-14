return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip", -- Snippets plugin
  },
  keys = {
    {"<leader>D", function() vim.lsp.buf.defintion() end, mode = "n", desc = "Go to declaration"},
    {"<leader>d", function() vim.lsp.buf.definition() end, mode = "n", desc = "Go to definition"},
    {"<leader>i", function() vim.lsp.buf.implementation() end, mode = "n", desc = "List implementations"},
    {"<leader>r", function() vim.lsp.buf.references() end, mode = "n", desc = "List references"},
    {"<leader>K", function() vim.lsp.buf.hover() end, mode = "n", desc = "Show documentation for what is under the cursor"},
    {"<leader>k", function() vim.lsp.buf.signature_help() end, mode = "n", desc = "Display signature info"},
    {"<Leader>rn", function() vim.lsp.buf.rename() end, mode = "n", desc = "Rename"},
    {"<leader>ca", function() vim.lsp.buf.code_action({apply = true}) end, mode = "n", desc = "Apply code action (e.g. golang: Fill struct)"},
    {"<leader>f", function() vim.lsp.buf.format({async = true}) end, mode = "n", desc = "Format file"},
    {"<Leader>dk", function() vim.diagnostic.goto_prev() end, mode = "n", desc = "Go to previous diagnostic"},
    {"<Leader>dj", function() vim.diagnostic.goto_next() end, mode = "n", desc = "Go to next diagnostic"},
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Turn off inline diagnostics
    vim.diagnostic.config({
      virtual_text = false,
    })

    local on_attach = function(client, bufnr) end -- only run these when an LSP is available

    -- used to enable autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()
    --local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- configure servers --
    -- configure gopls
    -- installed with
    -- go install golang.org/x/tools/gopls@latest
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure golangci-lint
    -- installed with
    -- go install github.com/nametake/golangci-lint-langserver@latest
    -- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    lspconfig["golangci_lint_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure pyright
    -- installation managed by mason
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua_ls
    -- installation managed by mason
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- config bufls
    -- installation managed by mason
    lspconfig["bufls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure marksman
    -- installation managed by mason
    lspconfig["marksman"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure autocompletion
    -- nvim-cmp setup
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  end,
}
