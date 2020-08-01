;;; init-global-config.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-global-config.el
;; Description: Initialize Global Configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file initializes global configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(global-set-key (kbd "C-z") nil)

;; DefBindings
;; Unbind unneeded keys
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "M-/") nil)
;; -DefBindings

;; UTF8Coding
(unless *sys/win32*
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8))
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(when *sys/gui*
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;; -UTF8Coding

(when (and *sys/mac* *sys/gui*)
  (setq mac-command-modifier 'meta
        mac-option-modifier 'super))

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 column-number-mode t
 auto-save-default nil
 auto-save-list-file-prefix nil
 make-backup-files nil
 create-lockfiles nil
 load-prefer-newer t
 tooltip-delay 1.5
 ring-bell-function 'ignore
 sentence-end-double-space nil
 truncate-lines nil
 truncate-partial-width-windows nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(show-paren-mode 1)

;; Increase garbage collector threshold
(setq gc-cons-threshold 10000000)

  ;; Restore after startup
  (add-hook 'after-init-hook
            (lambda ()
              (setq gc-cons-threshold 1000000)
              (message "gc-cons-threshold restored to %S"
                       gc-cons-threshold)))

(provide 'init-global-config)
