;; Resize Width or Height of windows
(defun resize-window-width (w)
  "Resize the window width based on W."
  (interactive (list (if (> (count-windows) 1)
                         (read-number "Set the current window with in [1~9]x10%: ")
                       (error "You need more than 1 window to execute this function!"))))
  (message "%s" w)
  (window-resize nil (- (truncate (* (/ w 10.0) (frame-width))) (window-total-width)) t))

(defun resize-window-height (h)
  "Resize the window width based on H."
  (interactive (list (if (> (count-windows) 1)
                         (read-number "Set the current window height in [1~9]x10%: ")
                       (error "You need more than 1 window to execute this function!"))))
  (message "%s" h)
  (window-resize nil (- (truncate (* (/ h 10.0) (frame-height))) (window-total-height))) nil)

;; Setup shorcuts for window resize width and height
(global-set-key (kbd "C-z w") #'resize-window-width)
(global-set-key (kbd "C-z h") #'resize-window-height)


(defun resize-window (width delta)
  "Resize the current window's size. If WIDTH is non-nil, resize width by some DELTA."
  (if (> (count-windows) 1)
      (window-resize nil delta width)
    (error "You need more than 1 window to execute this function!")))

;; Setup shorcuts for window resize width and height
(global-set-key (kbd "M-W =") (lambda () (interactive) (resize-window t 5 )))
(global-set-key (kbd "M-W M-+") (lambda () (interactive) (resize-window t 5)))
(global-set-key (kbd "M-W -") (lambda () (interactive) (resize-window t -5)))
(global-set-key (kbd "M-W M-_") (lambda () (interactive) (resize-window t -5)))

(global-set-key (kbd "M-H =") (lambda () (interactive) (resize-window nil 5)))
(global-set-key (kbd "M-H M-+") (lambda () (interactive) (resize-window nil 5)))
(global-set-key (kbd "M-H -") (lambda () (interactive) (resize-window nil -5)))
(global-set-key (kbd "M-H M-_") (lambda () (interactive) (resize-window nil -5)))
;; -ResizeWidthheight

(provide 'init-windows)
