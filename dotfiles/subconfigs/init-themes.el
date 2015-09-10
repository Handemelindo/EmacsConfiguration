(when (< emacs-major-version 24)
  (require-package 'color-theme))


;;----------------------------------------------------------------------------
;; cyborgpunk theme
;;----------------------------------------------------------------------------
(require-package 'cyberpunk-theme)
(require-package 'color-theme-sanityinc-tomorrow)

;;------------------------------------------------------------------------------
;; New-style theme support, in which per-frame theming is not possible
;;------------------------------------------------------------------------------
(setq-default custom-enabled-themes '(cyberpunk))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light-theme ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-tomorrow-blue))

(defun balanced-theme ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-tomorrow-eighties))

(defun dark-theme ()
  "Activate a dark color theme."
  (interactive)
  (load-theme 'cyberpunk))


(provide 'init-themes)
