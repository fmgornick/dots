vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").register({
  H = { require("harpoon.ui").nav_prev, "harpoon previous buffer" },
  L = { require("harpoon.ui").nav_next, "harpoon next buffer" },
  s = { ":HopChar2<cr>", "hop char" },
  S = { ":HopWord<cr>", "hop word" },
  ["<F1>"] = { require("dap").step_into, "dap step in" },
  ["<F2>"] = { require("dap").step_over, "dap step over" },
  ["<F3>"] = { require("dap").step_out, "dap step out" },
  ["<F4>"] = { require("dap").continue, "dap continue" },
  ["<S-LeftMouse>"] = { "<LeftMouse>:DapToggleBreakpoint<cr>", "toggle break" },
}, { prefix = "", mode = "n" })

require("which-key").register({
  ["/"] = { require("Comment.api").toggle.linewise.current, "toggle comment" },
  b = { require("harpoon.ui").toggle_quick_menu, "list marked buffers" },
  c = { ":bn|bd!#<cr>", "close buffer" },
  d = {
    name = "dap",
    c = { require("config.lsp.debuggers").debug, "continue" },
    b = { require("dap").toggle_breakpoint, "breakpoint" },
    B = {
      function()
        require("dap").set_breakpoint(vim.fn.input("breakpoint condition: "))
      end,
      "conditional bp",
    },
    e = { require("dapui").eval, "evaluate" },
    i = { require("dap").step_into, "step into" },
    l = { require("dap").run_last, "run last" },
    L = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("log message: "))
      end,
      "set log point",
    },
    o = { require("dap").step_over, "step over" },
    O = { require("dap").step_out, "step out" },
    r = { require("dap").repl.open, "open debug console" },
    R = { require("dap").restart, "restart debugger" },
    u = { require("dapui").toggle, "toggle dapui" },
  },
  e = {
    function()
      require("telescope").extensions.file_browser.file_browser({
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
      })
    end,
    "file explorer",
  },
  f = {
    name = "fuzzy",
    b = { require("telescope.builtin").buffers, "buffer browser" },
    c = {
      function()
        require("telescope.builtin").find_files({
          cwd = "~/.config/nvim",
        })
      end,
      "nvim config files",
    },
    C = { require("telescope.builtin").colorscheme, "color schemes" },
    d = { require("telescope.builtin").diagnostics, "buffer diagnostics" },
    f = {
      function()
        require("telescope.builtin").find_files({
          cwd = vim.lsp.buf.list_workspace_folders()[1],
        })
      end,
      "find project files",
    },
    F = {
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.expand("%:p:h"),
        })
      end,
      "find folder files",
    },
    g = {
      function()
        require("telescope.builtin").live_grep({
          cwd = vim.lsp.buf.list_workspace_folders()[1],
        })
      end,
      "grep project files",
    },
    G = {
      function()
        require("telescope.builtin").live_grep({
          cwd = vim.fn.expand("%:p:h"),
        })
      end,
      "grep folder files",
    },
    h = { require("telescope.builtin").help_tags, "help tags" },
    k = { require("telescope.builtin").keymaps, "keymaps" },
    o = { require("telescope.builtin").oldfiles, "old files" },
    q = { require("telescope.builtin").quickfix, "quickfix list" },
  },
  h = { ":noh<cr>", "no highlight" },
  l = {
    name = "lsp info",
    a = { vim.lsp.buf.code_action, "code action" },
    i = { ":LspInfo<cr>", "current buffer LSPs" },
    l = { ":NullLsLog<cr>", "null-ls log" },
    m = { ":Mason<cr>", "mason info" },
    n = { ":NullLsInfo<cr>", "null-ls info" },
    r = { vim.lsp.buf.rename, "rename var" },
  },
  m = { require("harpoon.mark").add_file, "mark buffer" },
  p = {
    name = "packer",
    s = { require("packer").sync, "sync" },
  },
  q = { ":q!<cr>", "quit" },
  Q = { ":qa!<cr>", "quit all" },
  r = { ":source $MYVIMRC<cr>", "reload config" },
  t = {
    name = "terminal",
    h = {
      function()
        vim.cmd("botright 24 split")
        vim.cmd("cd" .. vim.lsp.buf.list_workspace_folders()[1])
        vim.cmd("term")
        vim.cmd("startinsert")
      end,
      "horizontal",
    },
    v = {
      function()
        vim.cmd("botright 80 vsplit")
        vim.cmd("cd" .. vim.lsp.buf.list_workspace_folders()[1])
        vim.cmd("term")
        vim.cmd("startinsert")
      end,
      "vertical",
    },
  },
  v = {
    name = "vstasks",
    v = {
      require("config.vstask").list_tasks,
      "list tasks",
    },
    l = {
      require("config.vstask").open_launch,
      "open launch.json",
    },
    t = {
      require("config.vstask").open_tasks,
      "open task.json",
    },
  },
  w = { ":w<cr>", "write" },
  x = {
    name = "exec trouble",
    d = { require("config.trouble").open_document_diagnostics, "document dignostics" },
    l = { require("config.trouble").open_loclist, "loclist" },
    q = { require("config.trouble").open_quickfix, "quickfix" },
    w = { require("config.trouble").open_workspace_diagnostics, "workspace diagnostics" },
    x = { require("config.trouble").open, "open trouble" },
  },
  y = {
    name = "yank",
    f = { ":let @+=expand('%:p')<cr>", "filepath" },
    y = { "ggVGy<c-o>", "all contents" },
  },
}, { prefix = "<leader>", mode = "n" })

require("which-key").register({
  ["/"] = {
    "<Plug>(comment_toggle_linewise_visual)<cr>",
    "toggle comment",
  },
}, { prefix = "<leader>", mode = "v" })
