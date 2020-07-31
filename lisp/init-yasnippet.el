(use-package yasnippet
  :config
      (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
      (yas-global-mode 1))
(use-package yasnippet-snippets
             :after yasnippet
             :ensure t)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
