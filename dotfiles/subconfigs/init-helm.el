;;----------------------------------------------------------------------------
;; helm settings (TAB in helm window for actions over selected items,
;;----------------------------------------------------------------------------
;; C-SPC to select items)
(require-package 'helm)
(require-package 'helm-projectile)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(after 'projectile
  (require-package 'helm-projectile))
(global-set-key (kbd "M-x") 'helm-M-x)

(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
  (helm-other-buffer '(helm-buffers-list
                       helm-elscreen
                       helm-projectile-files-list
                       helm-ctags
                       helm-recentf
                       helm-locate)
                     "*helm-my-buffers*")))
;;----------------------------------------------------------------------------
;; Nicer naming of buffers for files with identical names
;;----------------------------------------------------------------------------
(require 'uniquify)
(require 'uniquify)

(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-helm)
