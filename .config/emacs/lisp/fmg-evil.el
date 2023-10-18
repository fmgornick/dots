(use-package evil
	:config
	(evil-mode 1))

;; can't teach an old dog new tricks
(defalias 'evil-insert-state 'evil-emacs-state)
(global-set-key (kbd "<escape>") 'evil-exit-emacs-state)

(use-package undo-tree
  :diminish
  :config
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

;; easier window switching
(evil-define-key 'normal global-map (kbd "C-h") 'evil-window-left)
(evil-define-key 'normal global-map (kbd "C-j") 'evil-window-down)
(evil-define-key 'normal global-map (kbd "C-k") 'evil-window-up)
(evil-define-key 'normal global-map (kbd "C-l") 'evil-window-right)

(defun fmg/shift-up ()
	(interactive)
	(drag-stuff-up 1)
	(indent-region evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-down ()
	(interactive)
	(drag-stuff-down 1)
	(indent-region evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-right ()
	(interactive)
	(evil-shift-right evil-visual-beginning evil-visual-end)
	(evil-normal-state)
	(evil-visual-restore))

(defun fmg/shift-left ()
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(provide 'fmg-evil)
