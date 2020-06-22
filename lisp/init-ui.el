(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(use-package disable-mouse
  :init
  (global-disable-mouse-mode)
  :custom
  (disable-mouse-mode-global-lighter nil))

(if (and *sys/mac* *sys/gui*)
    (menu-bar-mode 1)
  (menu-bar-mode -1))

;; Suppress GUI features
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-message t
      ;; initial-scratch-message nil
      inhibit-startup-echo-area-message t)

(tool-bar-mode -1)
(set-scroll-bar-mode nil)

;; defalias allows you to rename a command. It is usually used to abbreviate command name.
(fset 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(fset 'list-buffers 'ibuffer) ; always use ibuffer

(unless (and *sys/mac* *sys/gui*)
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; I generally prefer to hide the menu bar, but doing this on OS X
;; simply makes it update unreliably in GUI frames, so we make an
;; exception.
(if *sys/mac*
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (unless (display-graphic-p frame)
                  (set-frame-parameter frame 'menu-bar-lines 0))))
  (when (fboundp 'menu-bar-mode)
    (menu-bar-mode -1)))

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(when *sys/gui*
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (global-set-key (kbd "M-S-<return>") 'toggle-frame-fullscreen)
  (global-set-key (kbd "C-S-<return>") 'toggle-frame-maximized))

(when *sys/gui*
  (setq initial-frame-alist
        '((width . 110)
          (height . 42))))

(defun sanityinc/adjust-opacity (frame incr)
  "Adjust the background opacity of FRAME by increment INCR."
  (unless (display-graphic-p frame)
    (error "Cannot adjust opacity of this frame"))
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         ;; The 'alpha frame param became a pair at some point in
         ;; emacs 24.x, e.g. (100 100)
         (oldalpha (if (listp oldalpha) (car oldalpha) oldalpha))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

;; Transparency
(global-set-key (kbd "C-M-6") (lambda () (interactive) (sanityinc/adjust-opacity nil -5)))
(global-set-key (kbd "C-M-7") (lambda () (interactive) (sanityinc/adjust-opacity nil 5)))
(global-set-key (kbd "C-M-8") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 75)))))
(global-set-key (kbd "C-M-9") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

;; Change global font size easily
(use-package default-text-scale)
(add-hook 'after-init-hook 'default-text-scale-mode)





(provide 'init-ui)
