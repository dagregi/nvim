return {
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "rcarriga/nvim-notify",
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = {
          winblend = 30
        },
        layout = {
          spacing = 4,
          align = "center"
        }
      })
      require("which-key").register({
        ["<leader>"] = {
          s = { name = "+ search" },
        }
      })
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = "doom",
        config = {
          header = {
            [[      ██████╗  █████╗  ██████╗ ██████╗ ███████╗ ██████╗ ██╗       ]],
            [[      ██╔══██╗██╔══██╗██╔════╝ ██╔══██╗██╔════╝██╔════╝ ██║       ]],
            [[      ██║  ██║███████║██║  ███╗██████╔╝█████╗  ██║  ███╗██║       ]],
            [[      ██║  ██║██╔══██║██║   ██║██╔══██╗██╔══╝  ██║   ██║██║       ]],
            [[      ██████╔╝██║  ██║╚██████╔╝██║  ██║███████╗╚██████╔╝██║       ]],
            [[      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝       ]],
          },
            center = {
              {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'lua print(2)'
              },
              {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'f',
                keymap = 'SPC f d',
                action = 'lua print(3)'
              },
            },
          footer = {}
        }
      }
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' }
    }
  }
}
