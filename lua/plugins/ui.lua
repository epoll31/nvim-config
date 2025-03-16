return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox"
      }
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  --[[ {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end
  }, ]]

}
