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
                    vim.env.VIMRUNTIME .. "/lua",
                    "${3rd}/luv/library",
                },
            },
        },
    },
    root_markers = { ".git" },
}
