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

-- open certain files with skeleton code snippets
-- REQUIRES LUASNIP
local function skeleton(pattern, filetype, snippet)
  return {
    group = "Skeleton",
    pattern = pattern,
    callback = function()
      if vim.fn.line("$") ~= 1 or vim.fn.getline(1) ~= "" then return end
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
