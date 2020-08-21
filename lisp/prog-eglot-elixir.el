(use-package elixir-mode)

(add-to-list
 'eglot-server-programs
 '(elixir-mode . ("sh" "~/.elixir-ls/release/language_server.sh")))

(add-hook
 'elixir-mode-hook
 (lambda ()
   (subword-mode)
   (eglot-ensure)
   (company-mode)
   (flymake-mode)))

(provide 'prog-eglot-elixir)
