return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            functions = { "italic" },
            keywords = { "bold" },
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          leap = true,
          cmp = true,
          mason = true,
          which_key = true,
        },
      })
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup {
        filetypes = { "typescript", "typescriptreact", "json", "lua" },
        user_default_options = {
          --Display mode can be background | virtualtext | foreground
          mode = "virtualtext",
          tailwind = true,
          virtualtext = "██",
          always_update = true,
        }
      }
    end
  }
}
