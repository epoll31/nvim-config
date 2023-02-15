return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function(
  )
    local dashboard =
      require(
        "alpha.themes.dashboard"
      )
    local logo =
      [[


			
                     88                                                                 88                      
                     88                                                                 ""                      
                     88                                                                                         
 ,adPPYba,   ,adPPYb,88   ,adPPYba,    ,adPPYb,d8             8b,dPPYba,   8b       d8  88  88,dPYba,,adPYba,   
a8P_____88  a8"    `Y88  a8"     "8a  a8"    `Y88             88P'   `"8a  `8b     d8'  88  88P'   "88"    "8a  
8PP"""""""  8b       88  8b       d8  8b       88             88       88   `8b   d8'   88  88      88      88  
"8b,   ,aa  "8a,   ,d88  "8a,   ,a8"  "8a,   ,d88     888     88       88    `8b,d8'    88  88      88      88  
 `"Ybbd8"'   `"8bbdP"Y8   `"YbbdP"'    `"YbbdP"Y8     888     88       88      "8"      88  88      88      88  
                                       aa,    ,88                                                               
                                        "Y8bbdP"     



    ]]

    dashboard.section.header.val =
      vim.split(
        logo,
        "\n"
      )
    dashboard.section.buttons.val =
      {
        dashboard.button(
          "f",
          " "
            .. " Find file",
          ":Telescope find_files <CR>"
        ),
        dashboard.button(
          "n",
          " "
            .. " New file",
          ":ene <BAR> startinsert <CR>"
        ),
        dashboard.button(
          "r",
          " "
            .. " Recent files",
          ":Telescope oldfiles <CR>"
        ),
        dashboard.button(
          "g",
          " "
            .. " Find text",
          ":Telescope live_grep <CR>"
        ),
        dashboard.button(
          "c",
          " "
            .. " Config",
          ":e $MYVIMRC <CR>"
        ),
        dashboard.button(
          "s",
          "勒"
            .. " Restore Session",
          [[:lua require("persistence").load() <cr>]]
        ),
        dashboard.button(
          "l",
          "鈴"
            .. " Lazy",
          ":Lazy<CR>"
        ),
        dashboard.button(
          "q",
          " "
            .. " Quit",
          ":qa<CR>"
        ),
      }
    for
      _,
      button
    in
      ipairs(
        dashboard.section.buttons.val
      )
    do
      button.opts.hl =
        "AlphaButtons"
      button.opts.hl_shortcut =
        "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl =
      "Type"
    dashboard.section.header.opts.hl =
      "AlphaHeader"
    dashboard.section.buttons.opts.hl =
      "AlphaButtons"
    dashboard.opts.layout[1].val =
      8
    return dashboard
  end,
  config = function(
    _,
    dashboard
  )
    -- close Lazy and re-open when the dashboard is ready
    if
      vim.o.filetype
      == "lazy"
    then
      vim.cmd.close()
      vim.api.nvim_create_autocmd(
        "User",
        {
          pattern = "AlphaReady",
          callback = function(
          )
            require(
              "lazy"
            ).show()
          end,
        }
      )
    end

    require(
      "alpha"
    ).setup(
      dashboard.opts
    )

    vim.api.nvim_create_autocmd(
      "User",
      {
        pattern = "LazyVimStarted",
        callback = function(
        )
          local stats =
            require(
              "lazy"
            ).stats()
          local ms = (
            math.floor(
              stats.startuptime
                  * 100
                + 0.5
            )
            / 100
          )
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(
            vim.cmd.AlphaRedraw
          )
        end,
      }
    )
  end,
}
