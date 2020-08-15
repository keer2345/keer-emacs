;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error
     "Your Emacs is too old -- this config requires v%s or higher"
     minver)))
;; (when (version< emacs-version "24.5")
;; (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; Speed up startup
(defvar keer-gc-cons-threshold (if (display-graphic-p) 8000000 800000)
  "The default value to use for `gc-cons-threshold'. If you experience freezing,decrease this.
If you experience stuttering, increase this.")

(defvar keer-gc-cons-upper-limit (if (display-graphic-p) 400000000 100000000)
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar keer-gc-timer (run-with-idle-timer 10 t #'garbage-collect)
  "Run garbarge collection when idle 10s.")

(defvar default-file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil)
(setq gc-cons-threshold keer-gc-cons-upper-limit)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Customization
(require 'init-custom)

;; Constants
(require 'init-const)
(require 'init-global-config)

;; Pakcages
;; Without this comment Emacs25 adds (package-initialize) here
(require 'init-elpa)
(require 'init-elpa-prelude)
(require 'init-elpa-purcell)

(require 'init-packages)

(require 'init-function)
(require 'init-shell)
(require 'init-ui)
(require 'init-themes)
(require 'init-windows)
(require 'init-tree)


(require 'init-utils)
(require 'init-which-key)
(require 'init-ivy)
(require 'init-company)
(require 'init-flycheck)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-markdown)
(require 'init-magit)

;; eidt
(require 'init-paredit)
(require 'init-edit)

;; Programming Configuration
(require 'prog-common)
(require 'prog-scala)
(require 'prog-org-mode)
(require 'prog-elixir)

(require 'init-lsp)
(require 'init-format)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
