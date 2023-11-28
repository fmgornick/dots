local trouble = require("trouble")

return {
  open = function() trouble.open() end,
  open_workspace_diagnostics = function() trouble.open("workspace_diagnostics") end,
  open_document_diagnostics = function() trouble.open("document_diagnostics") end,
  open_quickfix = function() trouble.open("quickfix") end,
  open_loclist = function() trouble.open("loclist") end,
  open_lsp_references = function() trouble.open("lsp_references") end,
}
