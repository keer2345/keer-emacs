(defun kill-all-buffer ()
  "Kill all buffer."
  (interactive)
  (dolist (buffer (buffer-list)) (kill-buffer buffer)))

(defun kill-other-buffer ()
  "Kill all of other buffer."
  (interactive)
  (dolist (buffer (delq (current-bufer) (buffer-list))) (kill-buffer buffer)))

(provide 'init-function)
