return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME .. "/lua",       -- nvim auto-complete
                    vim.fn.stdpath("config") .. "/lua", -- my config auto-complete
                    "${3rd}/luv/library",               -- lua stdlib
                },
            },
        },
    },
    root_markers = { ".git" },
}
