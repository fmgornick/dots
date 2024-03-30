local builtin = require("telescope.builtin")
local telescope = require("telescope")

local function parent_dir(dir) return vim.fn.fnamemodify(dir, ":h") end

local function match(dir, pattern)
  if string.sub(pattern, 1, 1) == "=" then
    return vim.fn.fnamemodify(dir, ":t") == string.sub(pattern, 2, #pattern)
  else
    return vim.fn.globpath(dir, pattern) ~= ""
  end
end

local function get_root()
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

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = "Telescope",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      pickers = {
        buffers = {
          theme = "ivy",
        },
      },
      extensions = {
        file_browser = {
          grouped = true,
          theme = "ivy",
          hijack_netrw = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          telescope.extensions.file_browser.file_browser({
            cwd = vim.fn.expand("%:p:h"),
            respect_gitignore = false,
          })
        end,
        desc = "file explorer",
      },
      { "<leader>fb", builtin.buffers, desc = "buffers" },
      {
        "<leader>fc",
        function() builtin.find_files({ cwd = "~/.config/nvim" }) end,
        desc = "nvim config files",
      },
      { "<leader>fC", builtin.colorscheme, desc = "color schemes" },
      { "<leader>fd", builtin.diagnostics, desc = "buffer diagnostics" },
      {
        "<leader>ff",
        function() builtin.find_files({ cwd = get_root() }) end,
        desc = "find project files",
      },
      {
        "<leader>fF",
        function() builtin.find_files({ cwd = vim.fn.expand("%:p:h") }) end,
        desc = "find folder files",
      },
      {
        "<leader>fg",
        function() builtin.live_grep({ cwd = get_root() }) end,
        desc = "grep project files",
      },
      {
        "<leader>fG",
        function() builtin.live_grep({ cwd = vim.fn.expand("%:p:h") }) end,
        desc = "grep folder files",
      },
      { "<leader>fh", builtin.help_tags, desc = "help tags" },
      { "<leader>fk", builtin.keymaps, desc = "keymaps" },
      { "<leader>fo", builtin.oldfiles, desc = "old files" },
      { "<leader>fq", builtin.quickfix, desc = "quickfix list" },
    },
    config = function(_, opts)
      telescope.setup(opts)
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    cmd = "Telescope file_browser",
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
}
