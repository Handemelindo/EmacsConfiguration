;;----------------------------------------------------------------------------
;; flycheck
;;----------------------------------------------------------------------------
(require-package 'flycheck)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(after 'flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled)
	flycheck-idle-change-delay 0.8
        flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)
        flycheck-checkers (delq 'html-tidy flycheck-checkers)
        flycheck-standard-error-navigation nil))

(global-flycheck-mode t)

;;----------------------------------------------------------------------------
;; flycheck errors on a tooltip (doesnt work on console)
;;----------------------------------------------------------------------------
(when (display-graphic-p (selected-frame))
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

;;----------------------------------------------------------------------------
;; flycheck using scalastyle
;;----------------------------------------------------------------------------
;;(setq flycheck-scalastyle-jar "~/.emacs.d/checkers/scalastyle.jar")

;;----------------------------------------------------------------------------
;; flycheck using lintr
;;----------------------------------------------------------------------------
;; (load "~/.emacs.d/checkers/lintr.el")

;; todo dictionary for mispelling

(provide 'init-static-checker)
