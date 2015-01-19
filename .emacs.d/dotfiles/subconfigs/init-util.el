;; various utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq local-coding-system 'utf-8)

;; key guide
(require-package 'guide-key)
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
;(setq guide-key/highlight-command-regexp "rectangle")
(guide-key-mode 1)

;; auto compilation from http://ergoemacs.org/emacs/emacs_byte_compile.html
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name))"`")
  (add-hook 'after-save-hook 'byte-compile-current-buffer)

;;wekatime
;(require-package 'wakatime-mode)
;(global-wakatime-mode)
;(setq wakatime-cli-path "C:\Python34\Lib\site-packages\wakatime\projects:)
;(setq wakatime-api-key "68e6f764-194d-444e-a2ee-66f09ef1a93f")

(provide 'init-util)
