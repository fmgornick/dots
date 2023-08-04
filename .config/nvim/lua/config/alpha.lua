local if_nil = vim.F.if_nil

local default_terminal = {
  type = "terminal",
  command = nil,
  width = 69,
  height = 8,
  opts = {
    redraw = true,
    window_config = {},
  },
}

local default_header = {
  type = "text",
  val = {
    [[                                                      ]],
    [[                                                      ]],
    [[                                                      ]],
    [[                                                      ]],
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
    [[                                                      ]],
    [[                                                      ]],
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}

local footer = {
  type = "text",
  val = {
    [[                                 ]],
    [[                                 ]],
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
    [[                                 ]],
    [[                                 ]],
    [[                                 ]],
    [[                                 ]],
  },
  opts = {
    position = "center",
    hl = "Number",
  },
}

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 3,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Include",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
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
end

local buttons = {
  type = "group",
  val = {
    button("f", "󰱽  find file", ":Telescope find_files<cr>"),
    button("n", "  new file", ":ene<cr>"),
    button("p", "  projects", ":Telescope projects<cr>"),
    button("r", "󱑁  recent files", ":Telescope oldfiles<cr>"),
    button("t", "󰊄  find text", ":Telescope live_grep<cr>"),
    button("c", "  configuration", ":Telescope find_files cwd=~/.config/nvim<cr>"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  terminal = default_terminal,
  header = default_header,
  buttons = buttons,
  footer = footer,
}

local config = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
    section.footer,
  },
  opts = {
    margin = 5,
  },
}

require("alpha").setup(config)
