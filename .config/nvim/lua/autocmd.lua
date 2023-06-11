-- highlight on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "YankHighlight",
    pattern = "*",
    callback = function()
        require("vim.highlight").on_yank({ higroup = "Search", timeout = 100 })
    end,
})

-- allow save if in not-yet-created directory
vim.api.nvim_create_augroup("Mkdir", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "YankHighlight",
    pattern = "*",
    callback = function()
        vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
    end,
})

-- open certain files with skeleton code snippets
local function skeleton(pattern, filetype, snippet)
    return {
        group = "Skeleton",
        pattern = pattern,
        callback = function()
            if vim.fn.line("$") ~= 1 or vim.fn.getline(1) ~= "" then
                return
            end
            local snips = require("luasnip").get_snippets()[filetype]
            for _, snip in pairs(snips) do
                if snip.name == snippet then
                    require("luasnip").snip_expand(snip)
                    return true
                end
            end
        end,
    }
end
vim.api.nvim_create_augroup("Skeleton", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", skeleton("*.tex", "tex", "hw"))
vim.api.nvim_create_autocmd("BufEnter", skeleton("tasks.json", "json", "tasks"))
vim.api.nvim_create_autocmd("BufEnter", skeleton("launch.json", "json", "launch"))
