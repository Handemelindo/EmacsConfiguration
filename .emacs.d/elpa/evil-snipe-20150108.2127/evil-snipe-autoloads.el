;;; evil-snipe-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "evil-snipe" "evil-snipe.el" (21687 20236 0
;;;;;;  0))
;;; Generated autoloads from evil-snipe.el

(autoload 'evil-snipe-mode "evil-snipe" "\
evil-snipe minor mode.

\(fn &optional ARG)" t nil)

(autoload 'evil-snipe-replace-evil "evil-snipe" "\
Override evil-mode's f/F/t/T functionality and replace it with evil-snipe's
version. No need to do `evil-nipe-enable-sS' with this.

\(fn)" nil nil)

(autoload 'evil-snipe-enable-sS "evil-snipe" "\
Enables s/S for repeating searches. Not necessary if using
`evil-snipe-replace-evil'. Kept for backwards compatibility.

\(fn)" nil nil)

(autoload 'turn-on-evil-snipe-mode "evil-snipe" "\
Enable evil-snipe-mode in the current buffer.

\(fn)" nil nil)

(autoload 'turn-off-evil-snipe-mode "evil-snipe" "\
Disable evil-snipe-mode in the current buffer.

\(fn)" nil nil)

(defvar global-evil-snipe-mode nil "\
Non-nil if Global-Evil-Snipe mode is enabled.
See the command `global-evil-snipe-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-snipe-mode'.")

(custom-autoload 'global-evil-snipe-mode "evil-snipe" nil)

(autoload 'global-evil-snipe-mode "evil-snipe" "\
Toggle Evil-Snipe mode in all buffers.
With prefix ARG, enable Global-Evil-Snipe mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Snipe mode is enabled in all buffers where
`turn-on-evil-snipe-mode' would do it.
See `evil-snipe-mode' for more information on Evil-Snipe mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-snipe-autoloads.el ends here
