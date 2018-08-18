;; ============================================================
;; Don't edit this file, edit 'org/cpp.org' instead ...
;; Auto-generated at Fri Aug 17 2018-08-17 14:08:00
;; ============================================================


;; #####################################################################################
(message "config • Clang-format …")

(straight-use-package 'clang-format)
(defun jse-init/clang-format()
  (require 'clang-format)
  (defun jse-cpp-clang-format-bindings ()
    (display-line-numbers-mode 1)
    (define-key c++-mode-map [tab] 'clang-format-region)
    (define-key c++-mode-map [?\t] 'clang-format-region))
  (add-hook 'c++-mode-hook 'jse-cpp-clang-format-bindings))
(add-to-list 'jse-pkg-init-funs #'jse-init/clang-format)


;; #####################################################################################
(message "config • Downcase local variables …")

(defun down-case-local-variables ()
  "Downcast local variables according to the current style guide (aLocalParam -> localParam)."
  (interactive)
  (let ((beg (if mark-active
                 (region-beginning)
               (min (line-beginning-position) (1- (point-max)))))
        (end (if mark-active
                 (region-end)
               (line-end-position)))
        (case-fold-search nil))

    (save-restriction
      (narrow-to-region beg end)
      (goto-char 1)
      (while (search-forward-regexp "\\<an?\\([A-Z]\\)" nil t)
        (replace-match (downcase (match-string 1)) t nil)))))
(defun jse-cpp-dclv-hook()
  (define-key c++-mode-map [f8] 'down-case-local-variables))
(add-hook 'c++-mode-hook 'jse-cpp-dclv-hook)


;; #####################################################################################
(message "config • Custom default compile command …")

(defun jse-cpp-compile-command-hook()
  (setq compile-command "hmo all_core"))
(add-hook 'c++-mode-hook 'jse-cpp-compile-command-hook)

(provide 'jse-cpp)
;;; jse-cpp.el ends here