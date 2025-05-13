-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

-- add lazy to runtime path
vim.opt.rtp:prepend(lazypath)

-- setup `mapleader` and `maplocalleader` before loading lazy.nvim
require("fmgornick.core")

-- Setup lazy.nvim
require("lazy").setup({
    spec = { { import = "fmgornick.plugins" } },
    checker = { notify = false },
    change_detection = { notify = false },
})
