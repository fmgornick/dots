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
function M.get_root()
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
function M.diff_view()
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
function M.advanced_diff_view()
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

return M
