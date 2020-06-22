(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Newline at end of file
(setq require-final-newline t)
(delete-selection-mode t)

(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0))
  :hook (after-init . avy-setup-default)
  :custom ( avy-all-windows nil
                avy-all-windows-alt t
                avy-background t
                avy-style 'pre))

;; Hungry deletion
(use-package hungry-delete
  :ensure nil
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  ;;  :config (setq-default hungry-delete-chars-to-skip " \t\f\v")
  )

(add-hook 'before-save-hook  'whitespace-cleanup)

(provide 'init-edit)
