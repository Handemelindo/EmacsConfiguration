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
(require 'init-benchmarking)
(require 'init-language)
(require 'init-auxiliary)
(require 'init-static-checker)
(require 'init-complete)
(require 'init-helm)
(require 'init-evil)
(require 'init-org-mode)
(require 'init-appearance)
(require 'init-version-control)
(require 'init-project-mngt)

(require 'init-util)
(require 'init-ido)
(require 'init-ibuffer)
(require 'init-persistence)
(require 'init-explorer)
(require 'init-csv)
(require 'init-themes)
(require 'init-cmd)

(provide 'init)
