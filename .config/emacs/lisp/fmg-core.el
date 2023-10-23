;; remove emacs uggo screen
(setq inhibit-splash-screen    t
      inhibit-starptup-screen  t
      inhibit-starptup-message t
      initial-scratch-message  nil)

(ido-mode 1)                                        ;; normal
(setq ido-enable-flex-matching t)                   ;; auto-complete
(setq ido-everywhere t)                             ;; be damned
(electric-pair-mode 1)                              ;; too lazy to close
(global-display-line-numbers-mode 1)                ;; i need 'em
(setq fill-column 100)                              ;; 70 too skinny
(setq-default tab-width 2)                          ;; 8-length tabs are psychotic
(setq ring-bell-function 'ignore)                   ;; i don't wanna hear it
(setf dired-kill-when-opening-new-dired-buffer t)   ;; too many dired buffers
(set-frame-font "FiraMono Nerd Font Mono 12" nil t) ;; yessir B)
(defalias 'yes-or-no-p 'y-or-n-p)                   ;; one letter's better than 3

(global-set-key (kbd "s-{") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "s-}") 'tab-bar-switch-to-next-tab)

;; floating frames can smd
(if (not (frame-parameter nil 'fullscreen)) 
  (toggle-frame-fullscreen))

(use-package diminish)

;; looks waaaay cooler than macros
(use-package multiple-cursors
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->"          . mc/mark-next-like-this)
   ("C-<"          . mc/mark-previous-like-this)
   ("C-c C-<"      . mc/mark-all-like-this)))

(provide 'fmg-core)
