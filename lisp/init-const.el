;;; init-common.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Personal information
(setq user-full-name keer-full-name)
(setq user-mail-address keer-mail-address)

;; Consts
  
(defconst keer-homepage
  "https://github.com/keer2345/keer-emacs"
  "The Github page of Keer Emacs.")

(defconst *sys/gui*
  (display-graphic-p)
  "Are we running on a GUI Emacs?")

(defconst *sys/win32*
  (eq system-type 'windows-nt)
  "Are we running on a Windows system?")

(defconst *sys/linux*
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst *sys/mac*
  (eq system-type 'darwin)
  "Are we running on a  Mac system?")

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(defconst *sys/root*
  (if (or *sys/linux* *sys/mac*)
      (string-equal "root" current-user))
  "Are we have ripgrep?")

(defconst *rg*
  (executable-find "find")
  "Do we have GNU find?")

(define-obsolete-function-alias 'after-load 'with-eval-after-load "")

(provide 'init-const)
