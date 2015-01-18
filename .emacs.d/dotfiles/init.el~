(setq user-full-name "Handemelindo")
(setq user-mail-address "yuanhangwang.silvio@gmail.com")

;; "after" macro definition
(if (fboundp 'with-eval-after-load)
  (defmacro after (feature &rest body)
     "After FEATURE is loaded, evaluate BODY."
     (declare (indent defun))
     `(with-eval-after-load ,feature ,@body))
   (defmacro after (feature &rest body)
     "After FEATURE is loaded, evaluate BODY."
     (declare (indent defun))
     `(eval-after-load ,feature
        '(progn ,@body))))

(add-to-list 'load-path
             (expand-file-name "dotfiles/subconfigs" user-emacs-directory))

(require 'init-package)
(require 'init-language)
(require 'init-static-checker)
(require 'init-appearance)
(require 'init-auxiliary)
(require 'init-evil)
(require 'init-complete)
(require 'init-helm)
(require 'init-org-mode)
(require 'init-persistence)
(require 'init-util)

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

;; disable backup files
(setq make-backup-files nil)

;; disable scroll bar
(scroll-bar-mode t)

(provide 'init)
