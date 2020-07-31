(use-package treemacs
  :ensure t
  :demand
  :config
  (require 'treemacs-themes)
  (require 'treemacs-icons)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-follow-mode -1)
  (add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))
  :bind (:map global-map ("C-x t t"   . treemacs))
  :commands treemacs-modify-theme
)

; Unifies projectile and treemacs
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(provide 'init-tree)
;;; init-tree.el ends here
