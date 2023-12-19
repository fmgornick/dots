vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("fmgornick.core")
require("lazy").setup({
  { import = "fmgornick.plugins" },
  { import = "fmgornick.plugins.lsp" },
}, {
  debug = false,
  defaults = {
    lazy = true,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})

vim.keymap.set("n", "<leader>ip", vim.cmd.Lazy, { desc = "plugins" })
