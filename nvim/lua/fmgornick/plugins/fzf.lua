return {
  "junegunn/fzf.vim",
  lazy = false,
  dependencies = { { "junegunn/fzf", build = "./install --all" } },
  keys = {
    { "<leader>fc", ":Configs<cr>", desc = "config files" },
    { "<leader>fo", ":History<cr>", desc = "old files" },
    { "<leader>fb", ":Buffers<cr>", desc = "buffers" },
    { "<leader>ff", ":PFiles<cr>", desc = "find files" },
    { "<leader>fF", ":Files<cr>", desc = "find files in current dir" },
    -- { "<leader>fg", ":PRG<cr>", desc = "grep files" },
    { "<leader>fG", ":RG<cr>", desc = "grep files in current dir" },
    { "<c-r>", ":History:<cr>", mode = "c", desc = "old commands" },
  },
  config = function()
    vim.g.fzf_layout = { tmux = "100%,100%" }
    vim.g.fzf_vim = { preview_window = {} }

    -- search for config files
    vim.api.nvim_create_user_command(
      "Configs",
      function(arg)
        vim.fn["fzf#vim#files"](arg.qargs, {
          source = "fd . ~/.config/alacritty ~/.config/git ~/.config/nvim ~/.config/tmux ~/.config/zsh",
          options = "--scheme=path --tiebreak=index",
        }, arg.bang)
      end,
      { bang = true, nargs = "?", complete = "dir" }
    )

    -- search files in project root directory
    vim.api.nvim_create_user_command("PFiles", function(arg)
      local dir = require("fmgornick.core.utils").get_root()
      vim.fn["fzf#vim#files"](arg.qargs, {
        source = "fd . " .. dir,
        options = "--scheme=path --tiebreak=index",
      }, arg.bang)
    end, { bang = true, nargs = "?", complete = "dir" })

    -- TODO: grep for files in root directory

    -- git diff
    vim.api.nvim_create_user_command(
      "GDiff",
      function()
        vim.fn["fzf#run"]({
          source = "echo HEAD; git branches",
          sink = "DiffviewOpen",
          tmux = "100%,100%",
        })
      end,
      {}
    )
  end,
}
