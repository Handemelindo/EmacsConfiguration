;;----------------------------------------------------------------------------
git
;;----------------------------------------------------------------------------
(require-package 'init-git)
(require-package 'yagist)
(require-package 'github-browse-file)
(require-package 'bug-reference-github)
(require-package 'github-clone)
(require-package 'magit-gh-pulls)
(require 'init-git)
(add-hook 'prog-mode-hook 'bug-reference-prog-mode)

(provide 'init-version-control)
