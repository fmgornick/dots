return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    header = {
      type = "text",
      val = {
        [[                                     ███              ]],
        [[                                                      ]],
        [[█████ ████  ██████   █████   █████  ████  ████████    ]],
        [[ ███  ███  ███  ███ ███     ███      ███   ███  ███   ]],
        [[ ███  ███  ███████   █████   █████   ███   ███        ]],
        [[ ███  ███  ███          ███     ███  ███   ███        ]],
        [[  ███████   ██████  ██████  ██████  █████ █████     ██]],
        [[      ███                                             ]],
        [[ ███  ███                                             ]],
        [[  █████                                               ]],
      },
      opts = {
        position = "center",
        hl = "Type",
      },
    },

    footer = {
      type = "text",
      val = {
        [[       ▄▄▄▄▄▄       ▄▄▄▄▄        ]],
        [[ ▄▄████████████▄ ▄██████████▄▄   ]],
        [[████████████████ ███████████████▄]],
        [[████████████████ ████████████████]],
        [[▀███████████████████████████████▀]],
        [[   ▀▀█████████████████████████▀  ]],
        [[        ▀▀▀███████████▀▀▀▀       ]],
        [[     ▄▄███████████████████▄▄▄    ]],
        [[ ▄█████████████████████████████▄ ]],
        [[█████████████████████████████████]],
        [[███████████████ ██ ██████████████]],
        [[ ██████████████ ██ ████████████▀ ]],
        [[   ▀▀████████▀  ██  ▀██████▀▀    ]],
        [[                ███              ]],
        [[                 ███             ]],
      },
      opts = {
        position = "center",
        hl = "Number",
      },
    },

    button = function(sc, txt, keybind, keybind_opts)
      local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Include",
      }
      if keybind then
        keybind_opts = vim.F.if_nil(keybind_opts, {
          noremap = true,
          silent = true,
          nowait = true,
        })
        opts.keymap = { "n", sc, keybind, keybind_opts }
      end

      local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
      end

      return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
      }
    end,
  },

  config = function(_, opts)
    require("alpha").setup({
      layout = {
        { type = "padding", val = 8 },
        opts.header,
        { type = "padding", val = 4 },
        {
          type = "group",
          opts = { spacing = 1 },
          val = {
            opts.button("f", "󰱽  find file", ":Telescope find_files<cr>"),
            opts.button("n", "  new file", ":ene<cr>"),
            opts.button("p", "  projects", ":Telescope projects<cr>"),
            opts.button("r", "󱑁  recent files", ":Telescope oldfiles<cr>"),
            opts.button("t", "󰊄  find text", ":Telescope live_grep<cr>"),
            opts.button("c", "  configuration", ":Telescope find_files cwd=~/.config/nvim<cr>"),
          },
        },
        { type = "padding", val = 3 },
        opts.footer,
      },
      opts = {
        margin = 5,
      },
    })
  end,
}
