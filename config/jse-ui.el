;; ============================================================
;; Don't edit this file, edit 'org/ui.org' instead ...
;; Auto-generated at Sat Aug 18 2018-08-18 21:51:17
;; ============================================================


;; #####################################################################################
(message "config • Font …")

(defun jse-require-font (font-plist)
  (when (find-font (font-spec :name (car font-plist)))
    (let* ((font (car font-plist))
           (props (cdr font-plist))
           (fontspec (apply 'font-spec :name font props)))
      (set-frame-font fontspec nil t)
      (push `(font . ,(frame-parameter nil 'font)) default-frame-alist))))

(defun jse-set-font (symbol value)
  (jse-require-font value))
(defcustom jse-display-font '("Source Code Pro for Powerline"
                              :size 14
                              :weight normal
                              :width normal
                              :style Regular)
  "Font name and properties to be used"
  :group 'jse-emacs
  :type '(cons string (plist :key-type (choice (const :size) (const :weight) (const :style) (const :width)) :value-type sexp))
  :set 'jse-set-font)


;; #####################################################################################
(message "config • Themes …")

(defun jse-install-or-load-package (pkg)
  (unless (require pkg nil 'noerror)
    (message (concat "Installing " (symbol-name 'pkg) "...")
             (straight-use-package pkg))
    (require pkg)))

(defun jse-get-theme-package (theme)
  (cond
   (t (intern (concat theme "-theme")))))

(defun jse-load-theme (theme)
  "Load the theme with the theme name `theme`"
  (let* ((theme-pkg (jse-get-theme-package theme))
         (theme-symbol (intern theme)))
    (unless (member theme-symbol (custom-available-themes))
      (jse-install-or-load-package theme-pkg))
    (load-theme theme-symbol t)
    (redisplay)))

(defun jse-cust-load-theme (symbol-name theme-name)
  (jse-load-theme theme-name))

(defcustom jse-theme "wombat"
  "Theme name to be loaded at startup"
  :group 'jse-emacs
  :type 'string
  :set 'jse-cust-load-theme)


;; #####################################################################################
(message "config • Spaceline (Nice modeline) …")

(use-package spaceline
  :defer t
  :ensure t
  :config 
  (require 'spaceline-config)
  (setq winum-auto-setup-mode-line nil))
(spaceline-spacemacs-theme)


;; #####################################################################################
(message "config • Winum (Select windows by numbers) …")

(use-package winum
:defer t
:init (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "C-`") 'winum-select-window-by-number)
          (define-key map (kbd "C-²") 'winum-select-window-by-number)
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
:config (winum-mode))


;; #####################################################################################
(message "config • Maximize Emacs on startup (on Mac) …")

(when (eq system-type 'darwin)
(toggle-frame-maximized))

(provide 'jse-ui)
;;; jse-ui.el ends here