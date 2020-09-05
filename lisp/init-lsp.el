;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
;; https://gist.github.com/victorolinasc/27c8e87139827048ba93db0bdfa7d3ef#file-dev-packages-el
;; https://nyk.ma/posts/emacs-2020-status/
(use-package lsp-mode
             :init
             (setq lsp-keymap-prefix "s-l"
                   read-process-output-max (* 1024 1024))
             ;;(setq read-process-output-max (* 1024 1024)) ;; 1mb
             :commands (lsp lsp-deferred)
	     :config
	     (setq lsp-prefer-flymake nil)
             :hook(;;(scala-mode . lsp-deferred)
                   (python-mode . lsp-deferred)
                   (elixir-mode . lsp-deferred)
                   ;; if you want which-key integration
                   (lsp-mode . lsp-enable-which-key-integration)))

;; optionally
(use-package lsp-ui
  :commands lsp-ui-mode
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25)
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
             :after (company lsp)
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
