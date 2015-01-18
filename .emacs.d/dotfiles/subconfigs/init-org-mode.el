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

;; automically add list
(require-package 'org-autolist)
(add-hook 'org-mode-hook (lambda () (org-autolist-mode)))

;; support UTF-8 bullets
(require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-at-item-bullet-mode t)))

;; todo add org-jira
;; todo add org mail
;; todo add org for presentation

(provide 'init-org-mode)
