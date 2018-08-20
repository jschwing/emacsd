;; ============================================================
;; Don't edit this file, edit 'org/core.org' instead ...
;; Auto-generated at Sat Aug 18 2018-08-18 13:49:39
;; ============================================================


;; #####################################################################################
(message "config • Encoding …")

(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))     ; pretty
(prefer-coding-system        'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; perdy
(setq locale-coding-system   'utf-8)   ; please
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq-default buffer-file-coding-system 'utf-8) ; with sugar on top


;; #####################################################################################
(message "config • Some sensible defaults …")

(setq gc-cons-threshold 2000000000)
(add-hook 'prog-mode-hook 'subword-mode)
(transient-mark-mode t)
(setq require-final-newline t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq-default dired-listing-switches "-alh")
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode t)
(show-paren-mode t)
(setq show-paren-delay 0.0)
(setq-default fill-column 120)
(setq mouse-yank-at-point t)
(setq delete-old-versions -1)		; delete excess backup versions silently
(setq version-control t)		; use version control
(setq vc-make-backup-files t)		; make backups file even when in version controlled dir
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.


;; #####################################################################################
(message "config • Modes …")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(display-line-numbers-mode)


;; #####################################################################################
(message "config • Personal Information …")

(setq user-full-name "Julian Schwing")
(setq user-mail-address "julian.schwing@gmail.com")

(provide 'jse-core)
;;; jse-core.el ends here