;;----------------------------------------------------------------------------
;; auto indent
;;----------------------------------------------------------------------------
(define-key global-map (kbd "RET") 'newline-and-indent)

;;----------------------------------------------------------------------------
;; shortcut for eshell
;;----------------------------------------------------------------------------
(global-set-key [f4] 'eshell)

;;----------------------------------------------------------------------------
;; auto pair
;;----------------------------------------------------------------------------
(require-package 'autopair)
(require 'autopair)
(autopair-global-mode)

;;----------------------------------------------------------------------------
;; remove whitespace before saving
;;----------------------------------------------------------------------------
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;----------------------------------------------------------------------------
;; undo tree
;;----------------------------------------------------------------------------
(require-package 'undo-tree)
(global-undo-tree-mode)

;;----------------------------------------------------------------------------
;; ctag function
;;----------------------------------------------------------------------------
(cond ((eq system-type 'gnu/linux)
       (setq path-to-ctags "/usr/bin/ctags")))
;; (cond ((eq system-type 'windows-nt)
;;        (setq path-to-ctags "/usr/bin/ctags")))
(defun create-ctags (dir-name)
  "create tags file, asks for dir"
  (interactive "DDirectory: ")
  (shell-command
    (format "%s -f %s/tags -eR %s" path-to-ctags (directory-file-name dir-name) (directory-file-name dir-name))))

;; smex
;; paredit
;; todo add killing buffer visualization
;; todo add RSS reader
;; todo add expand-region
;; elnode

(provide 'init-auxiliary)
