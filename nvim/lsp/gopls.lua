return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.mod", "go.sum", ".git" },
    settings = {
        gopls = {
            codelenses = { test = true, tidy = true, vendor = true },
            usePlaceholders = true,
        },
    },
}
