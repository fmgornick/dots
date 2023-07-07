(setq user-init-file "~/.config/emacs/init.el")
(setq user-emacs-directory "~/.local/share/emacs/")
(setq org-preview-latex-image-directory "~/.cache/emacs/ltximg/")

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

      (global-set-key (kbd "C-S-w h")  'windmove-left)
      (global-set-key (kbd "C-S-w j")  'windmove-down)
      (global-set-key (kbd "C-S-w k")    'windmove-up)
      (global-set-key (kbd "C-S-w l") 'windmove-right)

(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
			      :ref nil
			      :files (:defaults (:exclude "extensions"))
			      :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
	(if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
		 ((zerop (call-process "git" nil buffer t "clone"
				       (plist-get order :repo) repo)))
		 ((zerop (call-process "git" nil buffer t "checkout"
				       (or (plist-get order :ref) "--"))))
		 (emacs (concat invocation-directory invocation-name))
		 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
				       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
		 ((require 'elpaca))
		 ((elpaca-generate-autoloads "elpaca" repo)))
	    (progn (message "%s" (buffer-string)) (kill-buffer buffer))
	  (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))

(elpaca browse-kill-ring
	(browse-kill-ring-default-keybindings))

(elpaca exec-path-from-shell)

(elpaca pdf-tools
	(pdf-tools-install)
	(pdf-loader-install))
(elpaca org-noter)
(elpaca org-pdftools)
(elpaca org-noter-pdftools)

(elpaca nov
	(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(elpaca elfeed
	(global-set-key (kbd "C-x w") 'elfeed))

;;  (unless (package-installed-p 'evil)
;;    (package-install 'evil))

;;  (require 'evil)
;;  (evil-mode 1)

;;  (custom-set-variables
;;  '(package-selected-packages '(evil)))
;;  (custom-set-faces)

;;  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;;  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;;  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;;  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;  (define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-decrease-width)
;;  (define-key evil-normal-state-map (kbd "C-S-j") 'evil-window-increase-height)
;;  (define-key evil-normal-state-map (kbd "C-S-k") 'evil-window-decrease-height)
;;  (define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-increase-width)

;;  (define-key evil-visual-state-map "J" (concat ":m '>+1" (kbd "RET") "gv=gv"))
;;  (define-key evil-visual-state-map "K" (concat ":m '<-2" (kbd "RET") "gv=gv"))

;;  (define-key evil-visual-state-map (kbd "<") (lambda ()
;;  (interactive)
;;  (evil-shift-left (region-beginning) (region-end))
;;  (evil-normal-state)
;;  (evil-visual-restore)))
;;  (define-key evil-visual-state-map (kbd ">") (lambda ()
;; (interactive) 
;;  (evil-shift-right (region-beginning) (region-end))
;;  (evil-normal-state)
;;  (evil-visual-restore)))
