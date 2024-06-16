return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    opts = {
      client = "curl",
      env_file = "../.env",
      env_pattern = "\\.env$",
      env_edit_command = "tabedit",
      custom_dynamic_variables = {},
      logs = {
        level = "info",
        save = true,
      },
      result = {
        split = {
          stay_in_current_window_after_split = false,
        },
        behavior = {
          show_info = {
            url = true,
            headers = true,
            http_info = true,
            curl_command = true,
          },
          formatters = {
            json = "jq",
          },
        },
        keybinds = {
          buffer_local = true,
          prev = "H",
          next = "L",
        },
      },
      highlight = {
        enable = true,
        timeout = 200,
      },
    },
    keys = {
      { "<leader>x", "<cmd>Rest run<cr>", desc = "run request" },
      { "<leader>X", "<cmd>Rest run<cr>", desc = "run last request" },
      { "<leader>fe", "<cmd>Telescope rest select_env<cr>", desc = "find environment variables" },
    },
    config = function(_, opts) require("rest-nvim").setup(opts) end,
  },
}
