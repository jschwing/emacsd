;; ============================================================
;; Don't edit this file, edit 'org/packages.org' instead ...
;; Auto-generated at Fri Aug 17 2018-08-17 13:50:41
;; ============================================================


;; #####################################################################################
(message "config • Package Manager …")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; #####################################################################################
(message "config • WhichKey …")

(straight-use-package 'which-key)
(defun jse-init/which-key()
  (require 'which-key)
  (which-key-mode))  ; Enable which-key-mode
(add-to-list 'jse-pkg-init-funs #'jse-init/which-key)


;; #####################################################################################
(message "config • FZF …")

(straight-use-package 'fzf)
(defun jse-init/fzf()
  (require 'fzf))
(defun jse-add-keys/fzf()
  (global-set-key (kbd "C-x C-r") 'fzf-git))
(add-to-list 'jse-pkg-init-funs #'jse-init/fzf)
(add-to-list 'jse-pkg-keybindings #'jse-add-keys/fzf)


;; #####################################################################################
(message "config • Helm …")

(straight-use-package 'helm)
(defun jse-init/helm()
  (require 'helm)
  (helm-mode 1))
(defun jse-add-keys/helm()
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-s") 'helm-occur))
(add-to-list 'jse-pkg-init-funs #'jse-init/helm)
(add-to-list 'jse-pkg-keybindings #'jse-add-keys/helm)

(provide 'jse-packages)
;;; jse-packages.el ends here