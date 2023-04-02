return {
  {
    "folke/noice.nvim",
    lazy = true,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "rcarriga/nvim-notify" }
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    config = function ()
      require("nvim-tree").setup({
        sort_by = "name",
        view = {
          --width = 30,
        },
        renderer = {
          highlight_opened_files = "all",
          highlight_modified = "all",
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "",
                untracked = "★",
                deleted = "",
                ignored = "",
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = " ",
            warning = "",
            error = "",
          },
        },
        modified = {
          enable = true,
        },
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = '',
          section_separators = { left = '', right = ''},
          sections = {
            lualine_a = {
              { 'mode', separator = { left = '' }, right_padding = 2 },
            },
            lualine_b = { 'filename', 'branch' },
            lualine_c = { 'fileformat' },
            lualine_x = {},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
              { 'location', separator = { right = '' }, left_padding = 2 },
            },
          },
          inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
          }
        }
      })
    end
  },
  {
    "romgrk/barbar.nvim",
    lazy = true,
    config = function ()
      require("barbar").setup({
        icons = {
          button = '',
        },
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
          [vim.diagnostic.severity.WARN] = {enabled = false},
          [vim.diagnostic.severity.INFO] = {enabled = false},
          [vim.diagnostic.severity.HINT] = {enabled = true},
        },
        separator = { left = "", right = "" }
      })
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function ()
      require("barbecue").setup({
        theme = {
          -- this highlight is used to override other highlights
          -- you can take advantage of its `bg` and set a background throughout your winbar
          -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
          normal = { fg = "#c0caf5" },

          -- these highlights correspond to symbols table from config
          ellipsis = { fg = "#737aa2" },
          separator = { fg = "#737aa2" },
          modified = { fg = "#737aa2" },

          -- these highlights represent the _text_ of three main parts of barbecue
          dirname = { fg = "#737aa2" },
          basename = { bold = true },
          context = {},

          -- these highlights are used for context/navic icons
          context_file = { fg = "#ac8fe4" },
          context_module = { fg = "#ac8fe4" },
          context_namespace = { fg = "#ac8fe4" },
          context_package = { fg = "#ac8fe4" },
          context_class = { fg = "#ac8fe4" },
          context_method = { fg = "#ac8fe4" },
          context_property = { fg = "#ac8fe4" },
          context_field = { fg = "#ac8fe4" },
          context_constructor = { fg = "#ac8fe4" },
          context_enum = { fg = "#ac8fe4" },
          context_interface = { fg = "#ac8fe4" },
          context_function = { fg = "#ac8fe4" },
          context_variable = { fg = "#ac8fe4" },
          context_constant = { fg = "#ac8fe4" },
          context_string = { fg = "#ac8fe4" },
          context_number = { fg = "#ac8fe4" },
          context_boolean = { fg = "#ac8fe4" },
          context_array = { fg = "#ac8fe4" },
          context_object = { fg = "#ac8fe4" },
          context_key = { fg = "#ac8fe4" },
          context_null = { fg = "#ac8fe4" },
          context_enum_member = { fg = "#ac8fe4" },
          context_struct = { fg = "#ac8fe4" },
          context_event = { fg = "#ac8fe4" },
          context_operator = { fg = "#ac8fe4" },
          context_type_parameter = { fg = "#ac8fe4" },
        },
      })
    end
  }
}
