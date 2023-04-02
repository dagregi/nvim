return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function ()
      require("telescope").setup {
        pickers = {
          find_files = {
            find_command = { "fd" },
            hidden = true,
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        },
      }
      require("telescope").load_extension("fzf")
    end
  }
}
