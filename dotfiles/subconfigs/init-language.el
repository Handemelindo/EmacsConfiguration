;;----------------------------------------------------------------------------
;; scala, use ensime
;;----------------------------------------------------------------------------
(require-package 'scala-mode2)
(require-package 'ensime)
(require 'ensime)
(add-hook 'scala-mode'hook 'ensime-scala-mode-hook)
;; (require 'scala-mode-auto)
;; (add-hook 'scala-mode-hook
;; 	  '(lambda()
;; 	     (scala-mode-feature-electric-mode)))

;; (require 'scala-mode2)
;; (add-to-list)

;;----------------------------------------------------------------------------
;; r sas etc.
;;----------------------------------------------------------------------------
;; (require-package 'ess)

;;----------------------------------------------------------------------------
;; haskell
;;----------------------------------------------------------------------------
; identation
(require-package 'haskell-mode)
; ghc
(require-package 'ghc)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
; hi2
(require-package 'hi2)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
; source code helpers
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
(setq-default haskell-stylish-on-save t)

;;----------------------------------------------------------------------------
(require-package 'racket-mode)

;;----------------------------------------------------------------------------
;; markdown
;;----------------------------------------------------------------------------
;;(require-package 'markdown-mode)
;;(setq auto-mode-alist
;;      (cons '("\\.\\(md\\|markdown\\)\\'" . markdown-mode) auto-mode-alist))

;;----------------------------------------------------------------------------
;; ruby
;;----------------------------------------------------------------------------
;; (require-package 'inf-ruby)
;; (require-package 'ruby-mode)

;;----------------------------------------------------------------------------
;; latex
;;----------------------------------------------------------------------------
;; (require-package 'auctex)

;;----------------------------------------------------------------------------
;; todo julia
;;----------------------------------------------------------------------------

;; todo add modern regular expression support like visual-regexp-steroids
;; todo java support
;; todo prolog support
;; todo io support
;; todo add paredit-mode
;; todo add structured-haskell-mode

(provide 'init-language)
