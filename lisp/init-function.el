(defun k-kill-all-buffer ()
  "Kill all buffer."
  (interactive)
  (dolist (buffer (buffer-list)) (kill-buffer buffer)))

(defun k-kill-other-buffer ()
  "Kill all of other buffer."
  (interactive)
  (dolist (buffer (delq (current-bufer) (buffer-list))) (kill-buffer buffer)))

(defun k-duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c C-d") 'k-duplicate-line)

(provide 'init-function)
