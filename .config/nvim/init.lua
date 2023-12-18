vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
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

require("settings")
require("autocmd")
require("mappings")
require("config")
