local api = vim.api

-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "Search",
      timeout = 100,
    })
  end,
})

-- allow save if in not-yet-created directory
api.nvim_create_augroup("MkDir", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  group = "MkDir",
  pattern = "*",
  callback = function() vim.fn.mkdir(vim.fn.expand("%:p:h"), "p") end,
})

-- wrap in readme and latex files
api.nvim_create_augroup("SetWrap", { clear = true })
api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex", "*.http" },
  group = "SetWrap",
  command = "setlocal wrap linebreak nolist",
})

-- automatically enter insert mode on terminal buffer
api.nvim_create_augroup("InsertTerm", { clear = true })
api.nvim_create_autocmd("BufEnter", {
  group = "InsertTerm",
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then vim.cmd("startinsert") end
  end,
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
api.nvim_create_augroup("Skeleton", { clear = true })
api.nvim_create_autocmd("BufEnter", skeleton("*.tex", "tex", "hw"))
api.nvim_create_autocmd("BufEnter", skeleton("tasks.json", "json", "tasks"))
api.nvim_create_autocmd("BufEnter", skeleton("launch.json", "json", "launch"))
