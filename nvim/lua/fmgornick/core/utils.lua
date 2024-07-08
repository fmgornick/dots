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

-- check head with other branches
M.diff_view = function()
  local out = assert(io.popen('git branch -a --format="%(refname:short)"'))
  local branches = { "HEAD" }
  for line in out:lines() do
    table.insert(branches, line)
  end

  vim.ui.select(branches, { prompt = "branch to compare" }, function(branch1)
    if branch1 ~= nil then vim.cmd(":DiffviewOpen " .. branch1) end
  end)
end

-- check one branch with another
M.advanced_diff_view = function()
  local out = assert(io.popen('git branch -a --format="%(refname:short)"'))
  local branches = { "HEAD" }
  for line in out:lines() do
    table.insert(branches, line)
  end

  vim.ui.select(branches, { prompt = "branch 1 (old)" }, function(branch1)
    if branch1 ~= nil then
      vim.ui.select(branches, { prompt = "branch 2 (new)" }, function(branch2)
        if branch2 ~= nil then vim.cmd(":DiffviewOpen " .. branch1 .. ".." .. branch2) end
      end)
    end
  end)
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

return M
