return {
  "stevearc/dressing.nvim",
  init = function()
    vim.ui.select = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
    vim.ui.input = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
  opts = function()
    local function get_hight(self, _, max_lines)
      local results = #self.finder.results
      local PADDING = 2
      local LIMIT = math.floor(max_lines / 2)
      return (results <= (LIMIT - PADDING) and results + PADDING or LIMIT)
    end

    return {
      input = {
        win_options = { winblend = 0 },
      },
      select = {
        telescope = require("telescope.themes").get_dropdown({
          layout_config = { height = get_hight },
        }),
        get_config = function(opts)
          if opts.kind == "codeaction" then
            return {
              backend = "telescope",
              telescope = require("telescope.themes").get_cursor({
                layout_config = { height = get_hight },
              }),
            }
          end
        end,
      },
    }
  end,
  dependencies = {
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        {
          "rcarriga/nvim-notify",
          config = function()
            require("notify").setup({
              render = "compact",
              timeout = 450,
            })
          end,
        },
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("noice").setup({
          lsp = {
            signature = { enabled = false },
            hover = { enabled = false },
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
            lsp_doc_border = true,
          },
        })
      end,
    },
  },
}
