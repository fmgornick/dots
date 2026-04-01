return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod" },
    root_markers = { "go.mod", "go.sum", ".git" },
    settings = {
        gopls = {
            codelenses = { test = true },
            semanticTokens = true,
        },
    },
}
