return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
  event = "BufEnter",
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = "all",
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    matchup = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]a"] = "@parameter.inner",
          ["]b"] = "@block.outer",
          ["]l"] = "@loop.outer",
          ["]i"] = "@conditional.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]A"] = "@parameter.inner",
          ["]B"] = "@block.outer",
          ["]L"] = "@loop.outer",
          ["]I"] = "@conditional.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.inner",
          ["[b"] = "@block.outer",
          ["[l"] = "@loop.outer",
          ["[i"] = "@conditional.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[A"] = "@parameter.inner",
          ["[B"] = "@block.outer",
          ["[L"] = "@loop.outer",
          ["[I"] = "@conditional.outer",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").update({ with_sync = true })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
