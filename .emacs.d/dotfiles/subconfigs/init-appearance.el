;;----------------------------------------------------------------------------
;; adjust terminal color
;;----------------------------------------------------------------------------
(require-package 'color-theme-approximate)
(color-theme-approximate-on)

;;----------------------------------------------------------------------------
;; turn background darker
;;----------------------------------------------------------------------------
(when (display-graphic-p)
  (invert-face 'default))

;;----------------------------------------------------------------------------
;; cyborgpunk theme
;;----------------------------------------------------------------------------
(require-package 'cyberpunk-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'cyberpunk)
;; (setq molokai-theme-kit t)

;;----------------------------------------------------------------------------
;; line number
;;----------------------------------------------------------------------------
(require-package 'linum)
(global-linum-mode t)

;;----------------------------------------------------------------------------
;; color identifiers
;;----------------------------------------------------------------------------
(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)

;;----------------------------------------------------------------------------
;; highlight current line
;;----------------------------------------------------------------------------
(require-package 'hl-line)
(global-hl-line-mode)

;;----------------------------------------------------------------------------
;; highlight indent
;;----------------------------------------------------------------------------
(require-package 'indent-guide)
(require 'indent-guide)
(indent-guide-global-mode)

;;----------------------------------------------------------------------------
;; guess indentation to keep a consistent coding style with the file itself
;;----------------------------------------------------------------------------
(require-package 'dtrt-indent)
(dtrt-indent-mode 1)

;;----------------------------------------------------------------------------
;; highlight tabs
;;----------------------------------------------------------------------------
(setq-default highlight-tabs t)

;;----------------------------------------------------------------------------
;; highlight occurrence
;;----------------------------------------------------------------------------
(require-package 'highlight-symbol)
(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))

;;----------------------------------------------------------------------------
;; page break lines
;;----------------------------------------------------------------------------
(require-package 'page-break-lines)
(global-page-break-lines-mode)

;;----------------------------------------------------------------------------
;; highlight escape
;;----------------------------------------------------------------------------
(require-package 'highlight-escape-sequences)
(require 'highlight-escape-sequences)
(hes-mode)

;;----------------------------------------------------------------------------
;; deminish
;;----------------------------------------------------------------------------
(require-package 'diminish)
(diminish 'color-identifiers-mode)
(diminish 'undo-tree-mode)
(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))
(diminish 'page-break-lines-mode)

;; rainbow delimiters (different color for nested delimiters)
(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;----------------------------------------------------------------------------
;; fill column indicator
;;----------------------------------------------------------------------------
(require-package 'fill-column-indicator)
(require 'fill-column-indicator)
(add-hook 'text-mode-hok (lambda ()
			   (turn-on-auto-fill)
			   (fci-mode)
			   (set-fill-column 100)))
(add-hook 'scala-mode-hook (lambda ()
			     (fci-mode)
			     (set-fill-column 100)))

(add-hook 'haskell-mode-hook (lambda ()
			       (fci-mode)
			       (set-fill-column 100)))

(add-hook 'racket-mode-hook (lambda ()
			       (fci-mode)
			       (set-fill-column 100)))

;;----------------------------------------------------------------------------
;; smooth scrolling
;;----------------------------------------------------------------------------
(require-package 'smooth-scrolling)
(setq scroll-margin 5
    scroll-conservatively 9999
    scroll-step 1)

;;----------------------------------------------------------------------------
;; popwin
;;----------------------------------------------------------------------------
(require-package 'popwin)
(require 'popwin)
(popwin-mode t)

;;----------------------------------------------------------------------------
;; revert color
;;----------------------------------------------------------------------------
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;;----------------------------------------------------------------------------
;; Suppress GUI features
;;----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)


;;----------------------------------------------------------------------------
;; Show a marker in the left fringe for lines not in the buffer
;;----------------------------------------------------------------------------
(setq indicate-empty-lines t)


;;----------------------------------------------------------------------------
;; Window size and features
;;----------------------------------------------------------------------------
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(defun sanityinc/adjust-opacity (frame incr)
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(global-set-key (kbd "M-C-8") (lambda () (interactive) (sanityinc/adjust-opacity nil -2)))
(global-set-key (kbd "M-C-9") (lambda () (interactive) (sanityinc/adjust-opacity nil 2)))
(global-set-key (kbd "M-C-0") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (unless window-system
                (set-frame-parameter nil 'menu-bar-lines 0)))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

;;----------------------------------------------------------------------------
;;dynamically change cursor color
;;----------------------------------------------------------------------------
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" box))
(setq evil-operator-state-cursor '("red" hollow))

;;----------------------------------------------------------------------------
;; Make "C-x o" prompt for a target window when there are more than 2
;;----------------------------------------------------------------------------
(require-package 'switch-window)
(require 'switch-window)
(setq switch-window-shortcut-style 'alphabet)
(global-set-key (kbd "C-x o") 'switch-window)

;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

(global-set-key "\C-x|" 'split-window-horizontally-instead)
(global-set-key "\C-x_" 'split-window-vertically-instead)


;; Borrowed from http://postmomentum.ch/blog/201304/blog-on-emacs
(defun sanityinc/split-window()
  "Split the window to see the most recent buffer in the other window.
Call a second time to restore the original window configuration."
  (interactive)
  (if (eq last-command 'sanityinc/split-window)
      (progn
        (jump-to-register :sanityinc/split-window)
        (setq this-command 'sanityinc/unsplit-window))
    (window-configuration-to-register :sanityinc/split-window)
    (switch-to-buffer-other-window nil)))

(global-set-key (kbd "<f7>") 'sanityinc/split-window)
(global-set-key (kbd "<f6>")
                (lambda ()
                  (interactive)
                  (switch-to-buffer nil)))

;; todo add regular expression visulation like visual-regexp
;; todo fold
;; todo hid-lines or similiar
;; todo narrow region or similiar

(provide 'init-appearance)
