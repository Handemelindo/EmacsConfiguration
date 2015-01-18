;; project explorer
(require-package 'project-explorer)
(after 'project-explorer
  (setq pe/cache-directory "~/.emacs.d/cache/project_explorer")
        (setq pe/omit-regex (concat pe/omit-regex "\\|single_emails")))

;; todo add ECB
;; todo add dired mode
;; todo add ftp
;; todo add ssh
;; fuzzy finder like fiplr
(provide 'init-explorer)
