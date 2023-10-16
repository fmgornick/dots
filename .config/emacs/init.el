(setq user-init-file                    "~/.config/emacs/init.el"
      user-emacs-directory              "~/.local/share/emacs/"
      package-user-dir                  "~/.local/share/emacs/packages/"
      org-preview-latex-image-directory "~/.cache/emacs/ltximg/"
      backup-directory-alist            `((".*" . "~/.cache/emacs/backups/"))
      auto-save-file-name-transforms    `((".*" "~/.cache/emacs/autosaves/" t))
      auto-save-list-file-prefix        "~/.cache/emacs/autosaves/")

(setq inhibit-splash-screen    t
      inhibit-starptup-screen  t
      inhibit-starptup-message t
      initial-scratch-message  nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(setq fill-column 100)
(global-display-line-numbers-mode 1)
(if (not (frame-parameter nil 'fullscreen))
  (toggle-frame-fullscreen))

(setq ring-bell-function 'ignore)
(setf dired-kill-when-opening-new-dired-buffer t)
(set-frame-font "FiraMono Nerd Font Mono 12" nil t)
(add-to-list 'exec-path "/opt/homebrew/bin")
(setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'package)
(require 'use-package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa stable" . "https://stable.melpa.org/packages/") t)
(setq use-package-always-ensure t)
(package-initialize)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox-light-soft t))

(use-package vterm
  :hook (vterm-mode . (lambda () (display-line-numbers-mode -1))))

(use-package magit)
  
(use-package pdf-tools
  :hook
  (pdf-view-mode . (lambda () (pdf-view-midnight-minor-mode 1)))
  (pdf-view-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (pdf-tools-install)
  (pdf-loader-install))

(use-package nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package latex-preview-pane
  :config (latex-preview-pane-enable))

(use-package tex
  :ensure auctex
  :hook (LaTeX-mode . latex-preview-pane-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t))

(use-package multiple-cursors
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
  ("C->"          . mc/mark-next-like-this)
  ("C-<"          . mc/mark-previous-like-this)
  ("C-c C-<"      . mc/mark-all-like-this)))

(use-package markdown-mode
  :mode  ("README\\.md\\'" . gfm-mode)
  :init  (setq markdown-command "multimarkdown"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(nov auctex vterm pdf-tools multiple-cursors markdown-mode magit latex-preview-pane gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
