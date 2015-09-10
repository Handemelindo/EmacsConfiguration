;;----------------------------------------------------------------------------
;; project explorer
;;----------------------------------------------------------------------------
(require-package 'project-explorer)
(after 'project-explorer
  (setq pe/cache-directory "~/.emacs.d/cache/project_explorer")
        (setq pe/omit-regex (concat pe/omit-regex "\\|single_emails")))

;;----------------------------------------------------------------------------
;; dried and details
;;----------------------------------------------------------------------------
(require-package 'dired-details)
(require-package 'dired-details+)

;; todo add recent file trackter like recentf
;; todo add local file history
;; todo add ECB
;; todo add dired mode
;; todo add ftp
;; todo add ssh
;; todo fuzzy finder like fiplr
(provide 'init-explorer)
