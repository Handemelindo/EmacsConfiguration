;; use company
(require-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
; set delay to 0
(setq company-idle-delay 0)
; use a dark front-end
;; (require-package 'color)
;; (require 'color)
;; (deftheme behelit
;;     "Behelit, a heavily modified molokai-based theme.")
;;     `(company-scrollbar-bg ((,class (:background "#1c1c1c"))))
;;     `(company-scrollbar-fg ((,class (:background "#5f87d7"))))
;;     `(company-tooltip ((,class (:foreground "#5f87d7" :background "#1c1c1c"))))
; use tab key to complete
(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
          (indent-according-to-mode)))

;; company ghc
(require-package 'company-ghc)
(add-to-list 'company-backends 'company-ghc)

;; company ess for statistical language like R or SASS and etc.
(require-package 'company-ess)
(require 'company-ess)
(add-to-list 'company-backends 'company-ess-backend)

(provide 'init-complete)
