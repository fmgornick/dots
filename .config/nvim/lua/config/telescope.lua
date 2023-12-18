local fb_actions = require("telescope").extensions.file_browser.actions
local telescope = require("telescope")

telescope.setup({
  pickers = {
    buffers = {
      theme = "ivy",
      mappings = {},
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        n = {
          ["<bs>"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

-- local action_state = require("telescope.actions.state")
-- local actions = require("telescope.actions")
-- local telescope = require("telescope")
--
-- local function select_buffers(prompt_bufnr)
--   local picker = action_state.get_current_picker(prompt_bufnr)
--   local multi = picker:get_multi_selection()
--   if not vim.tbl_isempty(multi) then
--     actions.close(prompt_bufnr)
--     for _, j in pairs(multi) do
--       if j.path ~= nil then vim.cmd(string.format("bad %s", j.path)) end
--     end
--   else
--     actions.select_default(prompt_bufnr)
--   end
-- end
--
-- local function harpoon_mark(prompt_bufnr)
--   local picker = action_state.get_current_picker(prompt_bufnr)
--   local multi = picker:get_multi_selection()
--   if not vim.tbl_isempty(multi) then
--     require("telescope.pickers").on_close_prompt(prompt_bufnr)
--     pcall(vim.api.nvim_win_set_cursor, 0, picker.original_win_id)
--     for _, entry in ipairs(multi) do
--       if entry.filename then
--         require("harpoon.mark").add_file(entry.filename)
--       else
--         if entry.path then require("harpoon.mark").add_file(entry.path) end
--       end
--     end
--   end
-- end
--
-- telescope.setup({
--   pickers = {
--     buffers = {
--       mappings = {
--         n = {
--           d = actions.delete_buffer,
--           m = harpoon_mark,
--           s = actions.toggle_all,
--         },
--       },
--       theme = "ivy",
--     },
--   },
--   extensions = {
--     file_browser = {
--       grouped = true,
--       hijack_netrw = true,
--       mappings = {
--         n = {
--           ["<bs>"] = fb_actions.goto_parent_dir,
--           ["<cr>"] = select_buffers,
--           m = harpoon_mark,
--         },
--       },
--       theme = "ivy",
--     },
--   },
-- })
--
-- telescope.load_extension("file_browser")
