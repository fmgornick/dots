return {
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    root_markers = { ".git" },
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
            },
            latexFormatter = "latexindent",
        },
    },
}
