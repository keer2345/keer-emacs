;;; init-custom.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; M-x : customize-group -> convenience -> keer
(defgroup keer nil
  "Keer Emacs customizations."
  :group 'convenience
  :link '(url-link :tag "Github" "https://github.com/keer2345/keer-emacs"))

(defcustom keer-full-name "Keer Qin"
  "Set user full name."
  :group 'keer
  :type 'string)

(defcustom keer-short-name "Keer"
  "Set user short name."
  :group 'keer
  :type 'string)

(defcustom keer-mail-address "keer2345@gmail.com"
  "Set user email address."
  :group 'keer
  :type 'string)

(defcustom keer-proxy "127.0.0.1:10808"
  "Set network proxy."
  :group 'keer
  :type 'string)

(provide 'init-custom)
;;; init-custom.el ends here
