(global-set-key (kbd "s-t") 'fmg/tab-new)
(global-set-key (kbd "s-w") 'tab-bar-close-tab)
(global-set-key (kbd "s-{") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "s-}") 'tab-bar-switch-to-next-tab)

(defun fmg/tab-new ()
	"open new tab with scratch buffer"
	(interactive)
	(tab-bar-new-tab)
	(scratch-buffer))

(provide 'fmg-tabs)
