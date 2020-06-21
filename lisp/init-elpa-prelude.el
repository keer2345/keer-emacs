;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Copy from prelude's emacs
;;; https://github.com/bbatsov/prelude/blob/master/core/prelude-packages.el
;;;
(defvar prelude-packages '()
  "A list of packages to ensure are installed at launch")

(defun prelude-packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (every #'package-installed-p prelude-packages))

(defun prelude-require-package (package)
  "Install PACAKGE unless already installed."
  (unless (memq package prelude-packages)
    (add-to-list 'prelude-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun prelude-require-pacakges (packages)
  "Ensure PACKAGES are installed.
  Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(defun prelude-install-packages ()
  "Install all pacakges listed in `prelude-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (messge "%s" "Emacs Prelude is now refreshing its pacakge database...")
    (pacakge-refresh-contents)
    (message "%s" " done.")
    ;; install the missing pacakges
    (prelude-require-pacakges prelude-pacakges)))

;; run pacakge installation
(prelude-install-packages)

;;; prelude emacs pacakge end

(provide 'init-elpa-prelude)
