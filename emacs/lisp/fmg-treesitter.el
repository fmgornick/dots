(use-package tree-sitter
	:hook (tree-sitter-after-on . tree-sitter-hl-mode)
	:config (global-tree-sitter-mode))
(use-package tree-sitter-langs)

(provide 'fmg-treesitter)
