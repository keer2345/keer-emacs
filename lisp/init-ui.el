(if (and *sys/mac* *sys/gui*)
    (menu-bar-mode 1)
  (menu-bar-mode -1))

(use-package disable-mouse
  :init
  (global-disable-mouse-mode))


(provide 'init-ui)
