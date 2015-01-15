;; package source
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )
(package-initialize)
(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;;adjust terminal color
(color-theme-approximate-on)

;; molokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq molokai-theme-kit t)

;; evil mode
(require 'evil)
(evil-mode 1)

;; evil surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil args
;; locate and load the package
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

;; evil exchange
(require 'evil-exchange)
(evil-exchange-install)

;; evil matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; evil nerd commenter
(require 'evil-nerd-commenter)

;; evil visualstar
(global-evil-visualstar-mode)

;; evil snipe
(require 'evil-snipe)
(global-evil-snipe-mode 1)
(evil-snipe-replace-evil)
;(evil-snipe-enable-nN)

;; evil leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator
  "e" 'find-file)

;; acer jumper
(evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)

;; powerline
(require 'powerline)
(powerline-default-theme)
(display-time-mode t)

;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto pair
(require 'autopair)
(autopair-global-mode)

;; fill column indicator
(require 'fill-column-indicator)
(add-hook 'text-mode-hok (lambda ()
			   (turn-on-auto-fill)
			   (fci-mode)
			   (set-fill-column 82)))
(add-hook 'scala-mode-hook (lambda ()
			     (fci-mode)
			     (set-fill-column 94)))

;; disable backup files
(setq make-backup-files nil)

;; disable scroll bar
(scroll-bar-mode 1)

;; color identifiers
(package 'color-identifiers-mode)
(global-color-identifiers-mode)

;; rainbow delimiters (different color for nested delimiters)
(pacakge 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; flycheck
(package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(after 'flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
  (setq flycheck-standard-error-navigation nil))

(global-flycheck-mode t)

;; flycheck errors on a tooltip (doesnt work on console)
(when (display-graphic-p (selected-frame))
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

;; smooth scrolling
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; relative-line-numbers
(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(after 'projectile
  (package 'helm-projectile))
(global-set-key (kbd "M-x") 'helm-M-x)

(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-elscreen
                       helm-c-source-projectile-files-list
                       helm-c-source-ctags
                       helm-c-source-recentf
                       helm-c-source-locate)
                     "*helm-my-buffers*")))
;;dynamically change cursor color
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" box))
(setq evil-operator-state-cursor '("red" hollow))

;;wekatime
;(global-wakatime-mode)
;(setq wakatime-cli-path "C:\Python34\Lib\site-packages\wakatime\projects:)
;(setq wakatime-api-key "68e6f764-194d-444e-a2ee-66f09ef1a93f")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
