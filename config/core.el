;; ============================================================
;; Don't edit this file, edit '/data/d054411/emacsd/org/core.org' instead ...
;; Auto-generated at Wed Aug 15 2018-08-15 14:40:18
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
(setq-default buffer-file-coding-system 'utf-8) ; with sugar on top
