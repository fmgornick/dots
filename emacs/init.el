;; emacs config paths
(setq user-init-file                    "~/.config/emacs/init.el"
      user-emacs-directory              "~/.local/share/emacs/"
      package-user-dir                  "~/.local/share/emacs/packages/"
      org-preview-latex-image-directory "~/.cache/emacs/ltximg/"
      backup-directory-alist            `((".*" . "~/.cache/emacs/backups/"))
      auto-save-file-name-transforms    `((".*" "~/.cache/emacs/autosaves/" t))
      auto-save-list-file-prefix        "~/.cache/emacs/autosaves/")

;; extra executable paths
(add-to-list 'exec-path "/opt/homebrew/bin")
(setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))

;; remove emacs uggo other stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; straight.el package manager initialization
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
(setq use-package-version 'straight)

;; path to config files
(defvar fmg/config-dir "~/.config/emacs/")
(add-to-list 'load-path (expand-file-name "lisp" fmg/config-dir))
(add-to-list 'load-path (expand-file-name "lisp/languages" fmg/config-dir))

(require 'fmg-core)
(require 'fmg-epub)
(require 'fmg-evil)
(require 'fmg-git)
(require 'fmg-latex)
(require 'fmg-pdf)
(require 'fmg-shell)
(require 'fmg-tabs)
(require 'fmg-themes)
(require 'fmg-treesitter)
