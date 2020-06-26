(use-package treemacs
  :ensure t
  :demand
  :config
  (require 'treemacs-themes)
  (require 'treemacs-icons)
  :bind (:map global-map ("C-x t t"   . treemacs))
  :commands treemacs-modify-theme
)

(provide 'init-tree)
;;; init-tree.el ends here
