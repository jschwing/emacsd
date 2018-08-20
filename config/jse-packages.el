;; ============================================================
;; Don't edit this file, edit 'org/packages.org' instead ...
;; Auto-generated at Sat Aug 18 2018-08-18 21:41:15
;; ============================================================


;; #####################################################################################
(message "config • Use-Package …")

(setq package-enable-at-startup nil)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) 
(use-package diminish
:ensure t
:defer t)
(use-package delight
:ensure t
:defer t)


;; #####################################################################################
(message "config • Auto-update …")

(use-package auto-package-update
  :ensure t
    :defer t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


;; #####################################################################################
(message "config • WhichKey …")

(use-package which-key
:defer t
:ensure t
:config (which-key-mode))


;; #####################################################################################
(message "config • FZF …")

(use-package fzf
:defer t
:ensure t
:bind ("C-x C-r" . 'fzf-git))


;; #####################################################################################
(message "config • Color MOccur …")

(use-package color-moccur
  :ensure t
  :defer t
    :commands (isearch-moccur isearch-all)
  :bind (("M-s O" . moccur)
         :map isearch-mode-map
         ("M-o" . isearch-moccur)
         ("M-O" . isearch-moccur-all))
  :init
  (setq isearch-lazy-highlight t)
  :config
  (use-package moccur-edit))


;; #####################################################################################
(message "config • Helm …")

(use-package helm
  :ensure t
    :bind (("M-x" . helm-M-x)))


;; #####################################################################################
(message "config • PDF Tools …")

(use-package pdf-tools
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :ensure t
  :defer t
  :config
  (pdf-tools-install))

(provide 'jse-packages)
;;; jse-packages.el ends here