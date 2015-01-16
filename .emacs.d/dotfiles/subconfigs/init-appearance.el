;; adjust terminal color
(require-package 'color-theme-approximate)
(color-theme-approximate-on)

;; turn background darker
(when (display-graphic-p)
  (set-background-color "darkgrey"))

;; molokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq molokai-theme-kit t)

;; color identifiers
(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)

;; hl current line
(require-package 'hl-line)
(global-hl-line-mode)

;; hl indent
(require-package 'hl-indent)
(require 'hl-indent)
(hl-indent-mode)

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
			   (set-fill-column 82)))
(add-hook 'scala-mode-hook (lambda ()
			     (fci-mode)
			     (set-fill-column 94)))

(add-hook 'haskell-mode-hook (lambda ()
			       (fci-mode)
			       (set-fill-column 94)))

;; smooth scrolling
(require-package 'smooth-scrolling)
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; relative-line-numbers
;(require-package 'relative-line-numbers)
;(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
;(add-hook 'prog-mode-hook 'line-number-mode t)
;(add-hook 'prog-mode-hook 'column-number-mode t)

(provide 'init-appearance)
