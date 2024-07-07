(use-package vterm
  :hook (vterm-mode . (lambda () (display-line-numbers-mode -1))))

(provide 'fmg-shell)
