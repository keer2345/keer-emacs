;; https://gist.github.com/victorolinasc/27c8e87139827048ba93db0bdfa7d3ef#file-dev-packages-el
;; https://github.com/victorolinasc/dot_emacs/blob/master/init.el
;; https://www.badykov.com/emacs/2020/05/30/emacs-setup-for-elixir/

(prelude-require-pacakges '(erlang
                             ob-elixir))

(use-package elixir-mode
             ;;  :load-path "~/dev/projects/emacs-elixir"
             :init
             (add-to-list 'exec-path "~/.elixir-ls/release")
             (add-hook 'elixir-mode-hook
                       (lambda ()
                         (push '(">=" . ?\u2265) prettify-symbols-alist)
                         (push '("<=" . ?\u2264) prettify-symbols-alist)
                         (push '("!=" . ?\u2260) prettify-symbols-alist)
                         (push '("==" . ?\u2A75) prettify-symbols-alist)
                         (push '("=~" . ?\u2245) prettify-symbols-alist)
                         (push '("<-" . ?\u2190) prettify-symbols-alist)
                         (push '("->" . ?\u2192) prettify-symbols-alist)
                         (push '("<-" . ?\u2190) prettify-symbols-alist)
                         (push '("|>" . ?\u25B7) prettify-symbols-alist))))

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(use-package exunit
             :ensure t
             :diminish t
             :bind
             ("C-c e ." . exunit-verify-single)
             ("C-c e b" . exunit-verify)
             ("C-c e u a" . exunit-verify-all-in-umbrella)
             ("C-c e a" . exunit-verify-all)
             ("C-c e l" . exunit-rerun))

(provide 'prog-elixir)
;;; prog-elixir.el ends here
