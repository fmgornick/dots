return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local i = ls.insert_node
      local s = ls.snippet
      local t = ls.text_node
      ls.add_snippets("json", {
        s("tasks", {
          t({
            "{",
            '  "tasks": [',
            "    {",
            '      "label": "build",',
            '      "type": "shell",',
            '      "command": "cd ${workspaceFolder} && ',
          }),
          i(1, "[[BUILD COMMAND]]"),
          t({
            '"',
            "    },",
            "    {",
            '      "label": "run",',
            '      "type": "shell",',
            '      "command": "cd ${workspaceFolder} && ',
          }),
          i(2, "[[RUN COMMAND]]"),
          t({
            '"',
            "    },",
            "    {",
            '      "label": "clean",',
            '      "type": "shell",',
            '      "command": "cd ${workspaceFolder} && ',
          }),
          i(3, "[[CLEAN COMMAND]]"),
          t({
            '"',
            "    }",
            "  ]",
            "}",
          }),
        }),

        s("launch", {
          t({
            "{",
            '  "configurations": [',
            "    {",
            '      "name": "',
          }),
          i(1, "[[NAME]]"),
          t({
            '",',
            '      "type": "',
          }),
          i(2, "[[DAP]]"),
          t({
            '",',
            '      "request": "launch",',
            '      "program": "${workspaceFolder}/',
          }),
          i(3, "[[PATH]]"),
          t({
            '",',
            '      "cwd": "${workspaceFolder}",',
            '      "stopOnEntry": false,',
            '      "externalConsole": false,',
            '      "args": [ ',
          }),
          i(4, ""),
          t({
            " ]",
            "    }",
            "  ]",
            "}",
          }),
        }),
      })

      ls.add_snippets("tex", {
        s("hw", {
          t({
            "\\documentclass[11pt]{article}",
            "",
            "\\usepackage{amsmath}",
            "\\usepackage{amsfonts}",
            "\\usepackage{amsthm}",
            "\\usepackage{blkarray}",
            "\\usepackage{caption}",
            "\\usepackage{enumitem}",
            "\\usepackage{hyperref}",
            "\\usepackage{mathtools}",
            "\\usepackage{tikz}",
            "\\usepackage[top=1.5cm,bottom=2cm,left=1.25cm,right=1.75cm,marginparwidth=1.75cm]{geometry}",
            "\\setlength{\\parindent}{0cm}",
            "",
            "\\newcommand{\\R}{\\mathbb{R}}",
            "\\newcommand\\itm[1]{\\item[\\textbf{#1}]}",
            "\\newcommand{\\n}{\\vspace{0.3cm}}",
            "\\newtheorem{theorem}{Theorem}",
            "",
            "\\def\\lc{\\left\\lceil}",
            "\\def\\rc{\\right\\rceil}",
            "\\def\\lf{\\left\\lfloor}",
            "\\def\\rf{\\right\\rfloor}",
            "",
            "",
          }),
          t({ "\\title{\\vspace{-1.0cm}" }),
          i(1, "[[TITLE]]"),
          t({
            "}",
            "\\author{Fletcher Gornick}",
            "\\date{",
          }),
          i(2, "[[DATE]]"),
          t({
            "}",
            "",
            "\\begin{document}",
            "\\maketitle",
            "\\begin{enumerate}",
            "\\itm{",
          }),
          i(3, "[[FIRST ITEM]]"),
          t({
            "}",
            "\\end{enumerate}",
            "\\end{document}",
          }),
        }),
      })
    end,
  },
}
