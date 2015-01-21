(require-package 'org)
(require 'org)

;; set directories for org
(if (eq system-type 'windows-nt)
    (setq org-directory "C:/Users/handemelindo/OneDrive/Document/Org/Org"))

(if (eq system-type 'gnu/linux)
    (setq org-directory "/home/handemelindo/Document/Documents/Org/Org"))

;; todo add org-mobile
;; (if (eq system-type 'windows-nt)
;;     (setq org-mobile-directory "C:/Users/handemelindo/OneDrive/Document/Org/MobileOrg"))

;; (if (eq system-type 'gnu/linux)
;;     (setq org-mobile-directory "/home/handemelindo/Document/Documents/Org/Org"))

;; (setq org-mobile-inbox-for-pull (concat org-directory "/flagged.org"))

;;----------------------------------------------------------------------------
;; automically add list
;;----------------------------------------------------------------------------
(require-package 'org-autolist)
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

;;----------------------------------------------------------------------------
;; github markdown backend
;;----------------------------------------------------------------------------
(require-package 'ox-gfm)
;(require 'ox-gfm)

;;----------------------------------------------------------------------------
;; html5 slide backend
;;----------------------------------------------------------------------------
;; (require-package 'ox-html5slide)
;; (require 'ox-html5slide)

;;----------------------------------------------------------------------------
;; reveal.js slide backend
;;----------------------------------------------------------------------------
;; (require-package 'ox-reveal)
;; (require 'ox-reveal)
;; (setq org-reveal-root "~/.emacs.d/misc/reveal.js")

;;----------------------------------------------------------------------------
;; twitter bootstrap backend
;;----------------------------------------------------------------------------
;; (require-package 'ox-tebs)

;;----------------------------------------------------------------------------
;; pandoc backend
;;----------------------------------------------------------------------------
(require-package 'ox-pandoc)
;(require 'ox-pandoc)

;; todo add evernote support
;; todo add org-jira
;; todo add org mail
;; todo add org for presentation

(provide 'init-org-mode)
