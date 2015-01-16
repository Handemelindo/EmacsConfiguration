;; create backup files inside a desinate directory
(setq backup-directory-alist '((",", "~/.emacs.d/backups")))

;; save position in file
(require-package 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(provide 'init-persistence)
