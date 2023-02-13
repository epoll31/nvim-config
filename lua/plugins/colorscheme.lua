return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function(
    )
      require(
        "catppuccin"
      ).setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
      })
    end,
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
