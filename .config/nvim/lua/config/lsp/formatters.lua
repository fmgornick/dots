-- stylua: ignore start
local formatters = {
	black        = { binary = "black",        install = "brew install black"                                 },
	clang_format = { binary = "clang-format", install = "brew install clang-format"                          },
	gofumpt      = { binary = "gofmt",        install = "brew install gofumpt"                               },
	goimports    = { binary = "goimports",    install = "go install golang.org/x/tools/cmd/goimports@latest" },
	isort        = { binary = "isort",        install = "brew install isort"                                 },
	latexindent  = { binary = "latexindent",  install = "brew install latexindent"                           },
	prettierd    = { binary = "prettierd",    install = "brew install prettierd"                             },
	shfmt        = { binary = "shfmt",        install = "brew install shfmt"                                 },
	stylua       = { binary = "stylua",       install = "brew install stylua"                                },
}
-- stylua: ignore end

require("which-key").register({
  l = {
    F = {
      function()
        local all_installed = true
        local install_command = ""

        for _, s in pairs(formatters) do
          if vim.fn.executable(s.binary) ~= 1 then
            all_installed = false
            install_command = install_command .. "echo installing " .. s.binary .. "; "
            install_command = install_command .. s.install .. "; "
            install_command = install_command .. "echo '\\n'; "
          end
        end

        if all_installed then
          print("all formatters already installed!")
        else
          vim.cmd("vert copen 100")
          vim.cmd("set wrap")
          vim.cmd("AsyncRun -strip " .. install_command)
        end
      end,
      "install formatters",
    },
  },
}, { prefix = "<leader>", mode = "n" })

require("which-key").register({
  f = { function() vim.lsp.buf.format({ async = true }) end, "format" },
}, { prefix = "<leader>", mode = "v" })

require("conform").setup({
  -- stylua: ignore start
	formatters_by_ft = {
		bash            = { "shfmt"                            },
		c               = { "clang_format"                     },
		cpp             = { "clang_format"                     },
		css             = { "prettierd"                        },
		go              = { "goimports", "gofmt"               },
		graphql         = { "prettierd"                        },
		html            = { "prettierd"                        },
		javascript      = { "prettierd"                        },
		javascriptreact = { "prettierd"                        },
		json            = { "prettierd"                        },
		jsonc           = { "prettierd"                        },
		tex             = { "latexindent"                      },
		lua             = { "stylua"                           },
		markdown        = { "prettierd"                        },
		python          = { "isort", "black"                   },
		sh              = { "shfmt"                            },
		typescript      = { "prettierd"                        },
		typescriptreact = { "prettierd"                        },
		yaml            = { "prettierd"                        },
		zsh             = { "shfmt"                            },
    ["_"]           = { "trim_whitespace", "trim_newlines" },
	},
  -- stylua: ignore end

  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },

  log_level = vim.log.levels.WARN,
  notify_on_error = false,

  formatters = {
    clang_format = {
      command = "clang-format",
      prepend_args = {
        string
          .gsub(
            [[--style={
                BasedOnStyle: llvm,
                ColumnLimit: 100,
                AllowShortCaseLabelsOnASingleLine: true,
                AllowShortIfStatementsOnASingleLine: AllIfsAndElse
            }]],
            "\n +",
            " "
          )
          :sub(0, -1),
      },
    },
    latexindent = {
      prepend_args = {
        "-y=defaultIndent:' '",
      },
    },
    prettierd = {
      prepend_args = {
        -- "--tab-width=4",
        -- "--bracket-same-line",
      },
      range_args = function(ctx)
        return {
          "--line-start",
          ctx.range.start[1],
          "--line-end",
          ctx.range["end"][1],
        }
      end,
    },
    shfmt = {
      filetypes = { "bash", "sh", "zsh" },
      prepend_args = { "-i", "2" },
    },
    stylua = {
      prepend_args = {
        "--collapse-simple-statement=Always",
        "--indent-type=Spaces",
        "--indent-width=2",
        "--quote-style=AutoPreferDouble",
        "--sort-requires",
      },
      range_args = function(ctx)
        return {
          "--range-start",
          ctx.range.start[1],
          "--range-end",
          ctx.range["end"][1],
        }
      end,
    },
  },
})
