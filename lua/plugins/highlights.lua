return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependancies = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "windwp/nvim-ts-autotag" }
    },
    config = function ()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "typescript",
          "html",
          "javascript",
        },
        autotag = {
          enable = true,
          filetypes = { "typescript", "tsx", "jsx", "html" }
        },
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        auto_install = true,
      }
    end
  }
}
