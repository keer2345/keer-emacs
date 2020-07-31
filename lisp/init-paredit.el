;;; init-paredit.el --- Configure paredit structured editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; https://www.emacswiki.org/emacs/ParEdit
;; http://danmidwood.com/content/2014/11/21/animated-paredit.html

(use-package paredit)

(use-package rainbow-delimiters
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
    :config
    (setq rainbow-x-colors nil)
    (add-hook 'prog-mode-hook 'rainbow-mode))

(provide 'init-paredit)
;;; init-paredit.el ends here
