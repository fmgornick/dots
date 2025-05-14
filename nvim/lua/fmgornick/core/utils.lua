local M = {}

-- get parent dir of current working directory
local function parent_dir(dir) return vim.fn.fnamemodify(dir, ":h") end

-- see if directory has pattern in any of the files
local function match(dir, pattern)
    if string.sub(pattern, 1, 1) == "=" then
        return vim.fn.fnamemodify(dir, ":t") == string.sub(pattern, 2, #pattern)
    else
        return vim.fn.globpath(dir, pattern) ~= ""
    end
end

M.keymap = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then opts.desc = opts.desc end
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- search up through project for specific project defining files / dirs
M.get_root = function()
    local root = vim.lsp.buf.list_workspace_folders()[1]
    if root ~= nil then return root end

    local patterns = { ".git", ".hg", ".svn" }

    local current = vim.api.nvim_buf_get_name(0)
    local parent = parent_dir(current)

    while 1 do
        for _, pattern in ipairs(patterns) do
            if match(parent, pattern) then return parent end
        end

        current, parent = parent, parent_dir(parent)
        if parent == current then break end
    end
    return nil
end

-- toggle diff view of two windows
M.toggle_diff = function()
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

-- lsp diagnostic jump helper commands
M.next_diagnostic = function() vim.diagnostic.jump({ count = 1, float = true }) end
M.prev_diagnostic = function() vim.diagnostic.jump({ count = -1, float = true }) end

-- turn off lsp snippet highlighting
M.disable_snippet = function()
    vim.snippet.stop()
    vim.api.nvim_input("<esc>")
end

return M
