return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "lua_ls" }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end
      }
    end
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

}
