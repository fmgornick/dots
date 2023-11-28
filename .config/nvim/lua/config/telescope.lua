local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local telescope = require("telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

local function select_buffers(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    actions.close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then vim.cmd(string.format("bad %s", j.path)) end
    end
  else
    actions.select_default(prompt_bufnr)
  end
end

local function harpoon_mark(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  -- if next(multi) == nil then
  --   local selection = action_state.get_selected_entry()
  --   actions.close(prompt_bufnr)
  --   vim.api.nvim_buf_delete(selection.bufnr, { force = true })
  -- else
  --   actions.close(prompt_bufnr)
  --   for _, selection in ipairs(multi) do
  --     vim.api.nvim_buf_delete(selection.bufnr, { force = true })
  --   end
  -- end
  --   local picker = action_state.get_current_picker(prompt_bufnr)
  --   local multi = picker:get_multi_selection()
  --
  if not vim.tbl_isempty(multi) then
    require("telescope.pickers").on_close_prompt(prompt_bufnr)
    -- pcall(vim.api.nvim_set_current_win, picker.original_win_id)
    pcall(vim.api.nvim_win_set_cursor, 0, picker.original_win_id)
    for _, entry in ipairs(multi) do
      if entry.filename then
        require("harpoon.mark").add_file(entry.filename)
      else
        if entry.path then require("harpoon.mark").add_file(entry.path) end
      end
    end
  end
end

telescope.setup({
  pickers = {
    buffers = {
      mappings = {
        n = {
          d = actions.delete_buffer,
          m = harpoon_mark,
          s = actions.toggle_all,
        },
      },
      theme = "ivy",
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      hijack_netrw = true,
      mappings = {
        n = {
          ["<bs>"] = fb_actions.goto_parent_dir,
          ["<cr>"] = select_buffers,
          m = harpoon_mark,
        },
      },
      theme = "ivy",
    },
  },
})

telescope.load_extension("file_browser")
