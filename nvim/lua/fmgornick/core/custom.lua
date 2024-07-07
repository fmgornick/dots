local M = {}

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
