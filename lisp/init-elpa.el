;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require 'cl-lib)
(require 'package)


(setq package-archives
     '(
    ;;   ("gnu"   . "http://mirrors.163.com/elpa/gnu/")
    ;;   ("melpa" . "http://mirrors.163.com/elpa/melpa/")
    ;;   ("melpa-stable" . "http://mirrors.163.com/elpa/melpa-stable/")
    ;;   ("marmalade" . "http://mirrors.163.com/elpa/marmalade/")
    ;;   ("org" . "http://mirrors.163.com/elpa/org/")
      ("gnu"   . "http://elpa.emacs-china.org/gnu/")
      ("melpa" . "http://elpa.emacs-china.org/melpa/")
      ("marmalade" . "http://elpa.emacs-china.org/marmalade/")
))


;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

(use-package auto-package-update
  :if (not (daemonp))
  :custom
  (auto-pacakge-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))



(provide 'init-elpa)
