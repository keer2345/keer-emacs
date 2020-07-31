(use-package benchmark-init
    :config
    ;; To disable collection of benchmark data after init is done.
    (add-hook 'after-init-hook 'benchmark-init/deactivate))

  (add-hook 'after-init-hook
            (lambda () (message "loaded in %s" (emacs-init-time))))

(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("todo"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("fixme"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("why"    . "#FF4500")
          ("STUB"   . "#1E90FF")))
  (define-key hl-todo-mode-map (kbd "C-c H p") 'hl-todo-previous)
  (define-key hl-todo-mode-map (kbd "C-c H n") 'hl-todo-next)
  (define-key hl-todo-mode-map (kbd "C-c H o") 'hl-todo-occur)
  (define-key hl-todo-mode-map (kbd "C-c H i") 'hl-todo-insert)
  (add-hook 'prog-mode-hook 'hl-todo-mode)
)

(provide 'init-utils)
