(use-package evil
	:config (evil-mode 1))

;; can't teach an old dog new tricks
(defalias 'evil-insert-state 'evil-emacs-state)
(global-set-key (kbd "<escape>") 'fmg/exit-emacs-state)

(evil-set-initial-state 'Buffer-menu-mode 'emacs)
(evil-set-initial-state 'dired-mode       'emacs)
(evil-set-initial-state 'help-mode        'emacs)
(evil-set-initial-state 'vterm-mode       'emacs)

(use-package undo-tree
  :diminish
  :config
	(setq undo-tree-history-directory-alist `((".*" . "~/.cache/emacs/undo/")))
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(use-package drag-stuff
	:diminish
	:config (drag-stuff-global-mode 1))

;; lawd pls keep me in visual mode as long as possible
(evil-define-key 'visual global-map (kbd "<") 'fmg/shift-left)
(evil-define-key 'visual global-map (kbd "J") 'fmg/shift-down)
(evil-define-key 'visual global-map (kbd "K") 'fmg/shift-up)
(evil-define-key 'visual global-map (kbd ">") 'fmg/shift-right)

(defun fmg/exit-emacs-state ()
	"switch to normal mode the vim way (shifting cursor back)"
	(interactive)
	(if (not (bolp)) (left-char 1))
	(evil-exit-emacs-state))

(defun fmg/shift-up ()
	"move visual block of text up (with indentation)"
	(interactive)
	(drag-stuff-up 1)
	(indent-region evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-down ()
	"move visual block of text down (with indentation)"
	(interactive)
	(drag-stuff-down 1)
	(indent-region evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-right ()
	"shifts highlighted region right and stays highlighted"
	(interactive)
	(evil-shift-right evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-left ()
	"shifts highlighted region left and stays highlighted"
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(provide 'fmg-evil)
