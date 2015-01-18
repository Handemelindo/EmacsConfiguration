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

;; todo add killing buffer visualization
;; todo add RSS reader

(provide 'init-auxiliary)
