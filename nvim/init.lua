--------------------
-- CONFIG OPTIONS --
--------------------
vim.g.mapleader       = " "
vim.g.maplocalleader  = "\\"
vim.opt.clipboard     = "unnamedplus"
vim.opt.complete      = "o,t,.,w,b,u"
vim.opt.completeopt   = { "fuzzy", "menuone", "noselect" }
vim.opt.expandtab     = true
vim.opt.ignorecase    = true
vim.opt.inccommand    = "split"
vim.opt.mousescroll   = { "ver:1", "hor:1" }
vim.opt.number        = true
vim.opt.shiftwidth    = 4
vim.opt.showcmd       = false
vim.opt.showtabline   = 0
vim.opt.signcolumn    = "yes"
vim.opt.smartcase     = true
vim.opt.smartindent   = true
vim.opt.softtabstop   = 4
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.swapfile      = false
vim.opt.tabstop       = 4
vim.opt.termguicolors = true
vim.opt.title         = true
vim.opt.undofile      = true
vim.opt.wrap          = false
vim.opt.writebackup   = false

--------------
-- PACKAGES --
--------------
vim.pack.add({
    { name = "abolish",    src = "https://github.com/tpope/vim-abolish" },
    { name = "autopairs",  src = "https://github.com/windwp/nvim-autopairs" },
    { name = "colorizer",  src = "https://github.com/norcalli/nvim-colorizer.lua" },
    { name = "fzf",        src = "https://github.com/ibhagwan/fzf-lua" },
    { name = "gitsigns",   src = "https://github.com/lewis6991/gitsigns.nvim" },
    { name = "oil",        src = "https://github.com/stevearc/oil.nvim" },
    { name = "surround",   src = "https://github.com/tpope/vim-surround" },
    { name = "theme",      src = "https://github.com/sainnhe/everforest" },
    { name = "tmux",       src = "https://github.com/alexghergh/nvim-tmux-navigation" },
    { name = "treesitter", src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { name = "vimtex",     src = "https://github.com/lervag/vimtex" },
}, {
    confirm = false,
    start = true,
})

--------------------------
-- PACKAGE CONFIG/SETUP --
--------------------------

-- theme: everforest
vim.g.everforest_background = "soft"
vim.cmd.colorscheme("everforest")

-- syntax highlighting: treesitter
require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "latex" },
    },
})

-- directory navigation: oil
require("oil").setup({
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
})

-- file search/grep: fzf-lua
require("fzf-lua").setup({
    "fzf-native",
    files = { follow = true },
    grep = { follow = true },
    fzf_opts = { ["--layout"] = "default" },
    winopts = {
        border = "none",
        fullscreen = true,
        preview = { hidden = true },
    },
})

-- misc
require("nvim-autopairs").setup()

------------------------
-- AUTOMATIC COMMANDS --
------------------------

-- lsp format
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
    callback = function(args)
        if vim.lsp.get_clients() then
            vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
        end
    end,
})

-- remove trailing whitespace/newlines
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.hl.on_yank({ higroup = "Search", timeout = 100 }) end,
})

-- spell check and wrap lines in markdown/latex buffers
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("SetWrap", { clear = true }),
    pattern = { "*.md", "*.tex" },
    command = "setlocal spell wrap linebreak nolist",
})

-- force close any modified scratch buffers
vim.api.nvim_create_autocmd({ "BufLeave", "ExitPre" }, {
    command = "if bufname('%') ==# '' | setlocal nomodified | endif"
})

----------------------
-- HELPER FUNCTIONS --
----------------------

-- toggle diff view of two windows
local diffwindows = function()
    local windows = vim.api.nvim_list_wins()
    if #windows ~= 2 then
        vim.notify("must be exactly two windows to diff", vim.log.levels.WARN)
        return
    end

    local this_window = vim.api.nvim_get_current_win()
    local other_window
    for _, window in ipairs(windows) do
        if this_window ~= window then other_window = window end
    end

    local diff_command
    if vim.o.diff then
        diff_command = "diffoff"
    else
        diff_command = "diffthis"
    end

    vim.cmd(diff_command)
    vim.api.nvim_set_current_win(other_window)
    vim.cmd(diff_command)
    vim.api.nvim_set_current_win(this_window)
end

-------------
-- KEYMAPS --
-------------

-- directory navigation
vim.keymap.set({ "n", "v" }, "<leader>e", require("oil").open, { desc = "file explorer" })

-- file search/grepping
local fzf = require("fzf-lua")
fzf.config_files = function() fzf.files({ cwd = "~/.config" }) end
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>fc", fzf.config_files, { desc = "config files" })
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, { desc = "grep" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "keymaps" })
vim.keymap.set("n", "<leader>fl", fzf.loclist, { desc = "location list" })
vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "old files" })
vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "quickfix list" })
vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "resume search" })

-- git commands
local git = require("gitsigns")
vim.keymap.set("n", "]h", function() git.nav_hunk("next") end, { desc = "next hunk" })
vim.keymap.set("n", "[h", function() git.nav_hunk("prev") end, { desc = "previous hunk" })
vim.keymap.set("n", "[H", function() git.nav_hunk("first") end, { desc = "first hunk" })
vim.keymap.set("n", "]H", function() git.nav_hunk("last") end, { desc = "last hunk" })
vim.keymap.set("n", "<leader>gb", git.blame, { desc = "blame buffer" })
vim.keymap.set("n", "<leader>gc", fzf.git_branches, { desc = "checkout branch" })
vim.keymap.set("n", "<leader>gr", git.reset_hunk, { desc = "reset hunk" })
vim.keymap.set("n", "<leader>gR", git.reset_buffer, { desc = "reset buffer" })
vim.keymap.set("n", "<leader>gs", git.stage_hunk, { desc = "stage hunk" })
vim.keymap.set("n", "<leader>gS", git.stage_buffer, { desc = "stage buffer" })
vim.keymap.set("n", "<leader>gU", git.reset_buffer_index, { desc = "soft reset buffer" })

-- region movement helpers
vim.keymap.set("v", "H", "<gv", { desc = "move block left" })
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv", { desc = "move block down" })
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv", { desc = "move block up" })
vim.keymap.set("v", "L", ">gv", { desc = "move block right" })

-- tmux navigation
local ntnav = require("nvim-tmux-navigation")
vim.keymap.set("n", "<M-h>", ntnav.NvimTmuxNavigateLeft, { desc = "nvim/tmux pane left" })
vim.keymap.set("n", "<M-j>", ntnav.NvimTmuxNavigateDown, { desc = "nvim/tmux pane down" })
vim.keymap.set("n", "<M-k>", ntnav.NvimTmuxNavigateUp, { desc = "nvim/tmux pane up" })
vim.keymap.set("n", "<M-l>", ntnav.NvimTmuxNavigateRight, { desc = "nvim/tmux pane right" })

-- misc keymap helpers
vim.keymap.set("n", "<c-g>", "2<c-g>", { desc = "get buffer info" })
vim.keymap.set("n", "<c-s>", ":noautocmd w<cr>", { desc = "save without formatting" })
vim.keymap.set("n", "yc", "<esc>:let @+=expand('%:p')<cr>", { desc = "yank file path" })
vim.keymap.set("n", "yf", ":%y+<cr>", { desc = "yank file contents" })
vim.keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment line", remap = true })
vim.keymap.set("v", "<leader>/", "gcgv", { desc = "toggle comment selection", remap = true })
vim.keymap.set("n", "<leader>r", ":edit!<cr>", { desc = "reset to last saved change" })
vim.keymap.set("n", "<leader>d", diffwindows, { desc = "toggle diff" })
vim.keymap.set("n", "<leader>u", vim.pack.update, { desc = "update plugins" })

-- lsp shortcuts
local logfile = function() vim.cmd("edit" .. vim.lsp.log.get_filename()) end
vim.keymap.set("n", "gL", logfile, { desc = "open lsp log file" })
vim.keymap.set("n", "grd", vim.lsp.buf.declaration, { desc = "jump to declaration" })
vim.keymap.set("n", "grl", vim.diagnostic.setloclist, { desc = "diagnostic local list" })
vim.keymap.set("n", "grq", vim.diagnostic.setqflist, { desc = "diagnostic quickfix list" })

---------
-- LSP --
---------

-- lsp config
vim.diagnostic.config({
    severity_sort = true,
    jump = {
        severity = {
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        },
    }
})

-- lsp servers
vim.lsp.enable({
    "clangd",
    "gopls",
    "kotlin_lsp",
    "lua_ls",
    "rust_analyzer",
})
