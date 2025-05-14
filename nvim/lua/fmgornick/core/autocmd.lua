-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Search",
            timeout = 100,
        })
    end,
})

-- allow save if in not-yet-created directory
vim.api.nvim_create_augroup("MkDir", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "MkDir",
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("%:p:h")
        if not dir:find("^oil:///") then vim.fn.mkdir(dir, "p") end
    end,
})

-- wrap in readme and latex files
vim.api.nvim_create_augroup("SetWrap", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = "SetWrap",
    pattern = { "*.md", "*.tex", "*.http" },
    command = "setlocal wrap linebreak nolist",
})

-- follow symbolic link to referenced file
vim.api.nvim_create_augroup("FollowSymlink", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "FollowSymlink",
    pattern = "*",
    callback = function()
        local file = vim.fn.expand("%")
        if not file:find("^oil:///") then
            vim.cmd("enew")
            vim.cmd.bwipeout("#")
            vim.cmd.edit(vim.fn.resolve(file))
            vim.cmd("filetype detect")
        end
    end,
})
