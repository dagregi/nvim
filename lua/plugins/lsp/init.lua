return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          {
            "lukas-reineke/lsp-format.nvim",
            config = function ()
              require("lsp-format").setup {}
            end
          },
          {
            "ms-jpq/coq_nvim",
          }
        },
        config = function ()
          local lspconfig = require("lspconfig")
          local coq = require("coq")
          lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
          lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
          lspconfig.tailwindcss.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
          lspconfig.eslint.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
          lspconfig.quick_lint_js.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
        end
      },
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        config = function ()
          require("mason").setup({
            ui = {
              icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
              }
            },
          })
        end
      }
    },
    config = function ()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "tsserver",
          "quick_lint_js",
          "lua_ls",
          "tailwindcss",
          "eslint"
        }
      }
    end
  },
  {
    require("plugins.lsp.luasnip")
  },
  {
    require("plugins.lsp.null_ls")
  }
}
