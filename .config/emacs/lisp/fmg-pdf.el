(use-package pdf-tools
	:hook
	(pdf-view-mode . (lambda ()
		(display-line-numbers-mode -1)
		(pdf-view-midnight-minor-mode 1)))
	:config
	(pdf-tools-install)
	(pdf-loader-install))

(add-hook 'pdf-view-mode-hook 'turn-off-evil-mode)

(provide 'fmg-pdf)
