local M = {}

-- cd to current buffer root-dir
M.reroot = function()
    local root = vim.lsp.buf.list_workspace_folders()[1]
    if root == nil then
        local markers = { ".git", ".hg", ".svn" }
        root = vim.fs.root(0, markers)
    end
    if root ~= nil then
        vim.cmd("cd" .. root)
        vim.print("new working directory: " .. root)
    end
end

-- set quickfix list with warning severity
M.setqflist = function()
    vim.diagnostic.setqflist({
        severity = {
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        },
    })
end

-- set location list with warning severity
M.setloclist = function()
    vim.diagnostic.setloclist({
        severity = {
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        },
    })
end

-- open lsp log
M.logfile = function() vim.cmd("edit" .. vim.lsp.get_log_path()) end

-- toggle diff view of two windows
M.diffwindows = function()
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

return M
