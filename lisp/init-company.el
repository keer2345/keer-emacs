;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; https://github.com/MatthewZMD/.emacs.d/blob/master/elisp/init-company.el

(use-package company
  :diminish company-mode
  :commands  company-abort
;;  :bind (("M-/" . company-complete))
  :custom
  (company-idel-delay 0.5)
  (company-tooltip-limit 10)
  (company-minimum-prefix-length 2)  
  (company-show-numbers t)

  :hook (after-init . global-company-mode))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(provide 'init-company)
