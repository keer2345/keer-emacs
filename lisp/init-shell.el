;;; Code:

;; On macOS Emacs doesn't use the shell PATH if it's not started from
;; the shell. Let's fix that:
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'init-shell)
;;; init-shell.el ends here
