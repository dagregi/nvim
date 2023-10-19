return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end,
      desc = "Explorer (NeoTree)",
    },
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      enable_diagnostics = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
      window = {
        width = 33,
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = true,
          expander_collapsed = " ",
          expander_expanded = " ",
        },
        name = { trailing_slash = false, use_git_status_colors = true },
        git_status = {
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
            unstaged = " ",
          },
        },
      },
      follow_current_file = true,
    })
  end,
}
