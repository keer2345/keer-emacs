;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(use-package lsp-mode
    :init
      (setq lsp-prefer-flymake nil)
      (setq lsp-keymap-prefix "s-l")
  ;; Optional - enable lsp-mode automatically in scala files
  :hook (
    (scala-mode . lsp-deferred)
    (lsp-mode . lsp-lens-mode)
    ;; if you want which-key integration
    (lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-prefer-flymake nil)
  :commands (lsp lsp-deferred))

;; Add metals backend for lsp-mode
;;(use-package lsp-metals)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)

;; Add company-lsp backend for metals
(use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )
(provide 'init-lsp)
