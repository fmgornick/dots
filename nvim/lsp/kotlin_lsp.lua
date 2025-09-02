return {
    filetypes = { "kotlin" },
    cmd = { "kotlin-lsp", "--stdio" },
    root_markers = {
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts",
    },
}
