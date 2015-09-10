(require-package 'org)
(require 'org)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Set directories for org
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

;;----------------------------------------------------------------------------
;; html5 slide backend
;;----------------------------------------------------------------------------
(require-package 'ox-html5slide)
(require 'ox-html5slide)

;;----------------------------------------------------------------------------
;; reveal.js slide backend
;;----------------------------------------------------------------------------
(require-package 'ox-reveal)
;; (require 'ox-reveal)
;; (setq org-reveal-root "~/.emacs.d/misc/reveal.js")

;;----------------------------------------------------------------------------
;; pandoc backend
;;----------------------------------------------------------------------------
(require-package 'ox-pandoc)


;;----------------------------------------------------------------------------
;; add file tree
;;----------------------------------------------------------------------------
(require-package 'org-fstree)

;;----------------------------------------------------------------------------
;; keywords
;;----------------------------------------------------------------------------
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "MAYBEONEDAY(m)" "|" "CANCELLED(c@/!)"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pomodoro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require-package 'org-pomodoro)
(after-load 'org-agenda
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; babel for these languages
;; R: install.packages("tikzDevice")
;; haskell: install lhs2TeX
;; todo add julia
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     ;; (R . t)
     (scala . t)
;     (julia . t)
     ;; (latex . t)
     ;; (ruby . t)
     (haskell . t))))

;; todo add evernote support
;; todo add org-jira
;; todo add org mail
;; todo add org for presentation

(provide 'init-org-mode)
