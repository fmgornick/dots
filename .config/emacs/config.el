(setq user-init-file                    "~/.config/emacs/init.el"
      user-emacs-directory              "~/.local/share/emacs/"
      org-preview-latex-image-directory "~/.cache/emacs/ltximg/")

(setq image-types (cons 'svg image-types))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq tab-width 2)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
(setq visible-cursor nil)

(setf dired-kill-when-opening-new-dired-buffer t)
(setq debug-on-error t)
;; (setq browse-url-browser-function 'eww-browse-url)

(defun reload ()
	"reload emacs configuration"
	(interactive)
	(load-file user-init-file))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package browse-kill-ring
  :config (browse-kill-ring-default-keybindings))

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (pdf-loader-install))

(use-package nov
  :mode ("\\.epub\\'" . nov-mode))

(use-package elfeed
  :bind ("C-x w" . elfeed))

(use-package evil
  :config (evil-mode 1))

(use-package evil-org
  :after org
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (add-hook 'org-mode-hook 'evil-org-mode))

(define-key evil-normal-state-map (kbd "H") 'evil-window-left)
(define-key evil-normal-state-map (kbd "J") 'evil-window-down)
(define-key evil-normal-state-map (kbd "K") 'evil-window-up)
(define-key evil-normal-state-map (kbd "L") 'evil-window-right)

(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-decrease-width)
(define-key evil-normal-state-map (kbd "C-S-j") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "C-S-k") 'evil-window-decrease-height)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-increase-width)

(define-key evil-visual-state-map "J" (concat ":m '>+1" (kbd "RET") "gv=gv"))
(define-key evil-visual-state-map "K" (concat ":m '<-2" (kbd "RET") "gv=gv"))

(define-key evil-visual-state-map (kbd "<")
  (lambda ()
    (interactive)
    (evil-shift-left (region-beginning) (region-end))
    (evil-normal-state)
    (evil-visual-restore)))

(define-key evil-visual-state-map (kbd ">")
  (lambda ()
    (interactive) 
    (evil-shift-right (region-beginning) (region-end))
    (evil-normal-state)
    (evil-visual-restore)))

(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)
