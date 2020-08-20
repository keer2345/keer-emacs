;; https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
;; https://gist.github.com/victorolinasc/27c8e87139827048ba93db0bdfa7d3ef#file-dev-packages-el
;; https://nyk.ma/posts/emacs-2020-status/

(use-package lsp-mode
             :commands (lsp lsp-deferred)
             :init
             (setq lsp-enable-snippet t     ;; use LSP apply snippet
                   lsp-auto-guess-root t    ;; auto g uess project's root path
                   lsp-response-timeout 20
                   lsp-auto-configure t
                   lsp-prefer-flymake nil   ;; we use flycheck
                   lsp-keymap-prefix "s-l"
                   lsp-session-file (expand-file-name ".cache/lsp-sessions" user-emacs-directory))
             ;; Optional - enable lsp-mode automatically in scala files
             :hook ((java-mode  ;; Set LSP start for which Major Mode
                     scala-mode
                     elixir-mode) . lsp-deferred)

             ;; if you want which-key integration
             (lsp-mode . lsp-enable-which-key-integration)
             :config
             (use-package lsp-java) ;; LSP of Java is independent, it need to install additional
             (setq lsp-prefer-flymake nil)
             (setq
               ;; I will describe my Elixir setup on a next post :)
               lsp-clients-elixir-server-executable "~/.elixir-ls/release/language_server.sh"
               lsp-auto-guess-root t) ; very useful
             (setq lsp-file-watch-ignored ; customize this to your liking :)
                   '("[/\\\\]\\.git$"
                     "[/\\\\]\\.elixir_ls$"
                     "[/\\\\]_build$"
                     "[/\\\\]assets$"
                     "[/\\\\]cover$"
                     "[/\\\\]node_modules$"
                     "[/\\\\]submodules$"
                     )))

;; Add metals backend for lsp-mode
;;(use-package lsp-metals)

;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ui
             :commands lsp-ui-mode
             :ensure t
             :after (lsp-mode)
             :config
             :init
             (setq lsp-ui-doc-enable nil ; does not work properly at the moment IMHO
                   lsp-ui-doc-use-webkit t
                   lsp-ui-sideline-enable nil ; clutters UI too much for my taste
                   lsp-ui-peek-enable nil) ; clutters UI too much for my taste
             :bind
             ("M-h" . lsp-ui-doc-show)  ; toogle functionality for docs
             ("s-h" . lsp-ui-doc-hide)) ; toogle functionality for docs

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

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
