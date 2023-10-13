local lsp = require("lsp-zero").preset()
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "gopls",
    "golangci_lint_ls",
    "jsonls",
    "kotlin_language_server",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "texlab",
    "tsserver",
    "yamlls",
  },
  automatic_installation = false,
})

local signs = {
  Error = "",
  Warn = "",
  Hint = "󰌶",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lspconfig.bashls.setup({ filetypes = { "bash", "sh", "zsh" } })
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      completion = {
        callable = {
          snippets = "fill_arguments",
        },
        fullFunctionSignatures = {
          enable = true,
        },
      },
    },
  },
})
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
})

lsp.setup()

vim.keymap.set("n", "ga", vim.diagnostic.setloclist)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "gn", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
