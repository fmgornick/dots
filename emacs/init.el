;;
;; default paths
;;
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/autosaves/" t))) ;; #autosave# files
(setq auto-save-list-file-prefix "~/.cache/emacs/autosaves/")                 ;; autosave file prefixes
(setq backup-directory-alist `(("." . "~/.cache/emacs/backups")))             ;; backup~ files
(setq ido-save-directory-list-file "~/.cache/emacs/ido.last")                 ;; ido selections
(setq lock-file-name-transforms '((".*" "~/.cache/emacs/locs/\\1" t)))        ;; #lock files
(setq lsp-session-file "~/.cache/emacs/lsp-session")                          ;; lsp session file
(setq mc/list-file "~/.cache/emacs/mc-lists.el")                              ;; multi-cursor preferences
(setq package-user-dir "~/.local/share/emacs/packages")                       ;; packages directory
(setq recentf-save-file "~/.cache/emacs/recentf")                             ;; recently visited files
(setq save-place-file "~/.cache/emacs/places")                                ;; cursor positions
(setq transient-history-file "~/.cache/emacs/transient/history.el")           ;; transient history file

;;
;; basic mode preferences
;;
(column-number-mode 1) ;; column number in mode line
(electric-pair-mode 1) ;; automatic parens pairing
(ido-mode 1)           ;; enable ido mode
(menu-bar-mode -1)     ;; no menu bar
(recentf-mode 1)       ;; remember recently visited files
(save-place-mode 1)    ;; remember cursor position
(scroll-bar-mode -1)   ;; no scroll bar
(tool-bar-mode -1)     ;; no tool bar

;;
;; sane defaults
;;
(setq-default indent-tabs-mode nil)                          ;; spaces instead of tabs
(setq inhibit-startup-message t)                             ;; no splash screen
(setq ring-bell-function 'ignore)                            ;; disable bell
(setq-default truncate-lines t)                              ;; no wrapping lines
(setq custom-safe-themes t)                                  ;; trust themes i've installed
(setq ido-enable-flex-matching t)                            ;; allow partial matching
(setq ido-everywhere t)                                      ;; use ido for most places
(set-frame-font "Hurmit Nerd Font Mono 13" nil t)            ;; default font
(global-display-line-numbers-mode t)                         ;; show line numbers
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; start in full-screen

;;
;; basic keymaps
;;
(global-set-key (kbd "s-!") 'shell-command)
(global-set-key (kbd "C-.") 'repeat)

;;
;; gnu/melpa package manager init
;;
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)
(unless package-archive-contents (package-refresh-contents))

;;
;; packages
;;
;; exec-path-from-shell
(unless (package-installed-p 'exec-path-from-shell) (package-install 'exec-path-from-shell))
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
;; multiple-cursors
(unless (package-installed-p 'multiple-cursors) (package-install 'multiple-cursors))
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; expand-region
(unless (package-installed-p 'expand-region) (package-install 'expand-region))
(global-set-key (kbd "C-=") 'er/expand-region)

;; lsp
(unless (package-installed-p 'lsp-mode) (package-install 'lsp-mode))
(unless (package-installed-p 'go-mode) (package-install 'go-mode))
(unless (package-installed-p 'company) (package-install 'company))
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'before-save-hook #'lsp-format-buffer)

;; magit
(unless (package-installed-p 'magit) (package-install 'magit))

;;
;; theme (everforest)
;;
(unless (file-directory-p "~/.local/share/emacs/theme")
  (shell-command "git clone https://github.com/Theory-of-Everything/everforest-emacs ~/.local/share/emacs/theme"))
(add-to-list 'custom-theme-load-path "~/.local/share/emacs/theme")
(load-theme 'everforest-hard-dark t)

;;
;; idk
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
