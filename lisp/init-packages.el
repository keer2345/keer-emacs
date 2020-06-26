(prelude-require-pacakges
 '(all-the-icons
   cl-lib
   dash
   diminish
   helpful
   hungry-delete
   ripgrep
   s
   try
   wgrep
   wgrep-ag
   ))

(use-package which-key
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 1.3)
  (which-key-idle-secondary-delay 0.3)
  :hook (after-init . which-key-mode))

(provide 'init-packages)
