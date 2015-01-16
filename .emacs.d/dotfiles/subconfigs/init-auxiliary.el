;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto pair
(require-package 'autopair)
(require 'autopair)
(autopair-global-mode)

;; remove whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; auto-refresh dired
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; c-k and c-j for scrolling
;(define-key evil-normal-state-map (kbd "C-k") (lambda ()
;						(interactive)
;						(evil-scroll-up nil)))
;
;(define-key evil-normal-state-map (kbd "C-j") (lambda ()
;						(interactive)
;						(evil-scroll-down nil)))

(provide 'init-auxiliary)
