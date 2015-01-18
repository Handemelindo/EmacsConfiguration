;; create backup files inside a desinate directory
(setq   backup-by-copying t      ; don't clobber symlinks
	backup-directory-alist
	'(("." . "~/.saves"))    ; don't litter my fs tree-down   delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	   version-control t)

;; save position in file
(require-package 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(provide 'init-persistence)
