return {
  {
    "windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup({
        check_ts = true
      })
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function ()
      require("Comment").setup()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  { "tveskag/nvim-blame-line" },
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
      })
    end
  }
}
