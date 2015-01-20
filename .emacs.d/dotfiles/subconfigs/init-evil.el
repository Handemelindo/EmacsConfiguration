;;----------------------------------------------------------------------------
;; evil mode
;;----------------------------------------------------------------------------
(require-package 'evil)
(require 'evil)
(evil-mode t)
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;;C-j and C-k for scrolling
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
						(interactive)
						(evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
						(interactive)
						(evil-scroll-down nil)))


;;----------------------------------------------------------------------------
;; evil surround
;;----------------------------------------------------------------------------
(require-package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode t)

;;----------------------------------------------------------------------------
;; evil args
;;----------------------------------------------------------------------------
;; locate and load the package
(require-package 'evil-args)
(add-to-list 'load-path "path/to/evil-args")
(require 'evil-args)
;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
;; bind evil-forward/backward-args
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)

;; bind evil-jump-out-args
(define-key evil-normal-state-map "K" 'evil-jump-out-args)

;;----------------------------------------------------------------------------
;; evil exchange
;;----------------------------------------------------------------------------
(require-package 'evil-exchange)
(require 'evil-exchange)
(evil-exchange-install)

;;----------------------------------------------------------------------------
;; evil matchit
;;----------------------------------------------------------------------------
(require-package 'evil-matchit)
(require 'evil-matchit)
(global-evil-matchit-mode t)

;;----------------------------------------------------------------------------
;; evil nerd commenter
;;----------------------------------------------------------------------------
(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

;;----------------------------------------------------------------------------
;; evil visualstar
;;----------------------------------------------------------------------------
(require-package 'evil-visualstar)
(global-evil-visualstar-mode t)

;;----------------------------------------------------------------------------
;; evil snipe
;;----------------------------------------------------------------------------
(require-package 'evil-snipe)
(require 'evil-snipe)
(global-evil-snipe-mode t)
(evil-snipe-replace-evil)
;(evil-snipe-enable-nN)

;;----------------------------------------------------------------------------
;; evil leader
;;----------------------------------------------------------------------------
(require-package 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator
  "e" 'find-file)

;;----------------------------------------------------------------------------
;; acer jumper
;;----------------------------------------------------------------------------
(require-package 'ace-jump-mode)
(evil-leader/set-key ",w" 'evil-ace-jump-word-mode)
(evil-leader/set-key ",j" 'evil-ace-jump-line-mode)
(evil-leader/set-key ",f" 'evil-ace-jump-char-mode)

;;----------------------------------------------------------------------------
;; evil tabs
;;----------------------------------------------------------------------------
(require-package 'evil-tabs)
(global-evil-tabs-mode t)
(define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create)
(define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill)
(define-key evil-normal-state-map "g0" (lambda() (interactive) (elscreen-goto 0)))
(define-key evil-normal-state-map "g " (lambda() (interactive) (elscreen-goto 0)))
(define-key evil-normal-state-map "g1" (lambda() (interactive) (elscreen-goto 1)))
(define-key evil-normal-state-map "g2" (lambda() (interactive) (elscreen-goto 2)))
(define-key evil-normal-state-map "g3" (lambda() (interactive) (elscreen-goto 3)))
(define-key evil-normal-state-map "g4" (lambda() (interactive) (elscreen-goto 4)))
(define-key evil-normal-state-map "g5" (lambda() (interactive) (elscreen-goto 5)))
(define-key evil-normal-state-map "g6" (lambda() (interactive) (elscreen-goto 6)))
(define-key evil-normal-state-map "g7" (lambda() (interactive) (elscreen-goto 7)))
(define-key evil-normal-state-map "g8" (lambda() (interactive) (elscreen-goto 8)))
(define-key evil-normal-state-map "g9" (lambda() (interactive) (elscreen-goto 9)))

;;----------------------------------------------------------------------------
;; powerline evil mode
;;----------------------------------------------------------------------------
(require-package 'powerline-evil)
(powerline-evil-center-color-theme)

;; todo ace window

(provide 'init-evil)
