;;----------------------------------------------------------------------------
;; use company
;;----------------------------------------------------------------------------
(require-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
; set delay to 0
(setq company-idle-delay 0)
; use tab key to complete
(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
          (indent-according-to-mode)))

;;----------------------------------------------------------------------------
;; company ghc
;;----------------------------------------------------------------------------
(require-package 'company-ghc)
(add-to-list 'company-backends 'company-ghc)

;;----------------------------------------------------------------------------
;; company ess for statistical language like R or SASS and etc.
;;----------------------------------------------------------------------------
;; (require-package 'company-ess)
;; (require 'company-ess)
;; (add-to-list 'company-backends 'company-ess-backend)

;; hippie-expand todo
;;(require-package 'hippie-expand)

;; todo add yasnippet

(provide 'init-complete)
