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
    pattern = { "*.md", "*.tex", "*.http" },
    group = "SetWrap",
    command = "setlocal wrap linebreak nolist",
})
