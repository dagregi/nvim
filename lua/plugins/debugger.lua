return {
  {
    "folke/trouble.nvim",
    config = function ()
      require("trouble").setup {
        signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
        },
      }
    end
  }
}
