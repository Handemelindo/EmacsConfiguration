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
(add-to-list 'load-path
             (expand-file-name "dotfiles/powerline" user-emacs-directory))

(require 'init-package)
(require 'init-language)
(require 'init-appearance)
(require 'init-auxiliary)
(require 'init-evil)
(require 'init-static-checker)
(require 'init-complete)
(require 'init-helm)
(require 'init-org-mode)
(require 'init-persistence)
(require 'init-explorer)
(require 'init-version-control)
(require 'init-util)

;; disable backup files
(setq make-backup-files nil)

;; disable scroll bar
(scroll-bar-mode t)

(provide 'init)
