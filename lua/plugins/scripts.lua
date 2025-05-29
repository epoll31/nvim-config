return {
  {
    "epoll31/scripts.nvim",
    -- dir = "~/projects/scripts.nvim",
    -- dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local scripts = require("scripts")
      scripts.setup()

      vim.keymap.set("n", "<leader>fss", function()
        require("scripts.api").picker("all")
      end, {
        desc = "[F]ind [S]cript",
      })
      vim.keymap.set("n", "<leader>fsh", function()
        require("scripts.api").picker("history")
      end, {
        desc = "[F]ind [S]cript from [H]istory",
      })
      vim.keymap.set({ "n", "i" }, "<C-Enter>", function()
        require("scripts.api").run_recent()
      end, {
        desc = "Run Previous Script",
      })
    end,
  },
}
