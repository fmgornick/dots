vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").register({
    H = { ":BufferLineCyclePrev<cr>", "previous buffer" },
    L = { ":BufferLineCycleNext<cr>", "next buffer" },
    s = { ":HopChar2<cr>", "hop char" },
    S = { ":HopWord<cr>", "hop word" },
}, { prefix = "", mode = "n" })

require("which-key").register({
    ["/"] = { ":CommentToggle<cr>", "toggle comment" },
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
            })
        end,
        "file explorer",
    },
    f = {
        name = "fuzzy",
        b = {
            function()
                require("telescope").extensions.file_browser.file_browser({
                    cwd = vim.fn.expand("%:p:h"),
                })
            end,
            "file browser",
        },
        c = {
            function()
                require("telescope.builtin").find_files({
                    cwd = "~/.config/nvim",
                })
            end,
            "nvim config files",
        },
        C = { require("telescope.builtin").colorscheme, "color schemes" },
        f = {
            function()
                require("telescope.builtin").find_files({
                    cwd = vim.fn.expand("%:p:h"),
                })
            end,
            "find files",
        },
        g = {
            function()
                require("telescope.builtin").live_grep({
                    cwd = vim.fn.expand("%:p:h"),
                })
            end,
            "live grep",
        },
        h = { require("telescope.builtin").help_tags, "help tags" },
        k = { require("telescope.builtin").keymaps, "keymaps" },
        o = { require("telescope.builtin").oldfiles, "old files" },
        p = { require("telescope").extensions.projects.projects, "projects" },
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
    p = {
        name = "packer",
        s = { require("packer").sync, "sync" },
    },
    q = { ":q!<cr>", "quit" },
    Q = { ":qa!<cr>", "quit all" },
    r = { ":source $MYVIMRC<cr>", "reload config" },
    t = {
        name = "terminal",
        h = { ":25 split<cr>:term<cr>i", "horizontal" },
        v = { ":80 vsplit<cr>:term<cr>i", "vertical" },
    },
    v = {
        function()
            require("telescope").extensions.vstask.tasks(require("telescope.themes").get_ivy())
        end,
        "list tasks",
    },
    w = { ":w<cr>", "write" },
    y = {
        name = "yank",
        f = { ":let @+=expand('%:p')<cr>", "filepath" },
        y = { "ggVGy<c-o>", "all contents" },
    },
}, { prefix = "<leader>", mode = "n" })

require("which-key").register({
    ["/"] = { ":CommentToggle<cr>", "toggle comment" },
}, { prefix = "<leader>", mode = "v" })
