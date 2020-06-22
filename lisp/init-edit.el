(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Newline at end of file
(setq require-final-newline t)
(delete-selection-mode t)

;; Hungry deletion
(use-package hungry-delete
  :ensure nil
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  ;;  :config (setq-default hungry-delete-chars-to-skip " \t\f\v")
  )

(add-hook 'before-save-hook  'whitespace-cleanup)

(provide 'init-edit)
