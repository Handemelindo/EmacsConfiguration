;; adjust terminal color
(require-package 'color-theme-approximate)
(color-theme-approximate-on)

;; turn background darker
(when (display-graphic-p)
  (invert-face 'default))

;; cyborgpunk theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'cyberpunk)
;; (setq molokai-theme-kit t)

;; color identifiers
(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)

;; highlight current line
(require-package 'hl-line)
(global-hl-line-mode)

;; highlight indent
(require-package 'indent-guide)
(require 'indent-guide)
(indent-guide-global-mode)

;; guess indentation to keep a consistent coding style with the file itself
(require-package 'dtrt-indent)
(dtrt-indent-mode 1)

;; highlight tabs
(setq-default highlight-tabs t)

;; deminish
(require-package 'diminish)
(diminish 'color-identifiers-mode)

;; rainbow delimiters (different color for nested delimiters)
(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; fill column indicator
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

;; smooth scrolling
(require-package 'smooth-scrolling)
(setq scroll-margin 5
    scroll-conservatively 9999
    scroll-step 1)

;; popwin
(require-package 'popwin)
(require 'popwin)
(popwin-mode t)

;; todo fold
;; todo hid-lines or similiar
;; todo narrow region or similiar

(provide 'init-appearance)
