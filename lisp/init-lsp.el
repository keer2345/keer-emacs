;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
;; https://gist.github.com/victorolinasc/27c8e87139827048ba93db0bdfa7d3ef#file-dev-packages-el
;; https://nyk.ma/posts/emacs-2020-status/
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq
   lsp-keymap-prefix "s-l")
  :hook(((scala-mode
          elixir-mode) . lsp-deferred)
        ;; if you want which-key integration
        (lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-prefer-flymake nil))

;; optionally
(use-package lsp-ui
  :commands lsp-ui-mode
  :after (lsp-mode))

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language


; Auto-complete sources from LSP servers
(use-package company-lsp
             :commands company-lsp
             :ensure t
             :after (company lsp)
             :config
             (setq company-transformers nil
                   company-lsp-async t
                   company-lsp-cache-candidates nil)
             (push 'company-lsp company-backends))

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
             ;; Posframe is a pop-up tool that must be manually installed for dap-mode
             )
(use-package dap-mode
             :hook
             (lsp-mode . dap-mode)
             (lsp-mode . dap-ui-mode))

(provide 'init-lsp)
;;; init-lsp.el ends here
