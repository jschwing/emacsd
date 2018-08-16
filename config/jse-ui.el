;; ============================================================
;; Don't edit this file, edit 'org/ui.org' instead ...
;; Auto-generated at Thu Aug 16 2018-08-16 13:22:29
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

(provide 'jse-ui)
;;; jse-ui.el ends here