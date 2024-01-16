  -- Better language-specific highlighting and formatting
return  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- import mason
      local mason = require("mason")

      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
        ui = {
          icons = {package_installed = "v", package_pending = ">", package_uninstalled = "x"}
        }
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "bufls",
          --"gopls", Installed this manually because versioning issue
          "lua_ls",
          "pyright",
        },
        -- autoinstall configured servers (with lspconfig)
        automatic_installation = true
      })
    end,
  }
