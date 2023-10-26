(use-package gruvbox-theme)
(use-package solarized-theme)

(defun fmg/load-theme (theme)
	(interactive
   (list
    (intern (completing-read "load custom theme: "
                             (mapcar #'symbol-name
				     (custom-available-themes))))))
	(load-theme theme t)
	(fmg/revert-all-buffers))

(defun fmg/revert-all-buffers ()
  "refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in emacs will not be reverted.
They will be reverted though if they were modified outside emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      ;; revert only buffers containing files, which are not modified
      ;; do not try to revert non-file buffers like *Messages*.
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            ;; If the file exists and is readable, revert the buffer.
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          ;; Otherwise, kill the buffer.
          (let (kill-buffer-query-functions) ; No query done when killing buffer
            (kill-buffer buf)
            (message "killed non-existing/unreadable file buffer: %s" filename))))))
  (message "finished reverting buffers containing unmodified files."))

(fmg/load-theme 'gruvbox-light-soft)

(provide 'fmg-themes)
