;;; init.el --- emacs main configuration file        -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  julian.schwing@gmail.com
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Compile configuration from config.org into config.el and load it

;;; Code:
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defconst jsc-config-org-dir (concat user-emacs-directory "org" "/")
  "Location of config org files")
(defconst jsc-config-el-dir (concat user-emacs-directory "config" "/")
  "Location of generated el files")
(defconst jsc-config-files '(
                             core
                             keybindings
                             )
  "List of configuration file names that should be loaded.")
(defvar jsc-init-el-start-time (current-time) "Time when init.el was started")

;;
;; Emacs core configuration
;;

;; from: http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
(defvar current-date-time-format "%a %b %d %Y-%m-%d %H:%M:%S"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

;; from: http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(toggle-debug-on-error)
(defun jsc-tangle-config-org (jscfn)
  "This function will write all source blocks from =<filename>.org= into =<filename>.el= that are ...
- not marked as =tangle: no=
- doesn't have the TODO state =DISABLED=
- have a source-code of =emacs-lisp="
  (require 'org)
  (let* ((body-list ())
         (output-file (concat jsc-config-el-dir jscfn ".el"))
         (orgfile (concat jsc-config-org-dir jscfn ".org"))
         (org-babel-default-header-args (org-babel-merge-params org-babel-default-header-args
                                                                (list (cons :tangle output-file)))))
    (message "—————• Re-generating %s …" output-file)
    (save-restriction
      (save-excursion
        (org-babel-map-src-blocks orgfile
          (let* (
                 (org_block_info (org-babel-get-src-block-info 'light))
                 ;;(block_name (nth 4 org_block_info))
                 (tfile (cdr (assq :tangle (nth 2 org_block_info))))
                 (match_for_TODO_keyword)
                 )
            (save-excursion
              (catch 'exit
                ;;(when (string= "" block_name)
                ;;  (message "Going to write block name: " block_name)
                ;;  (add-to-list 'body-list (concat "message(\"" block_name "\")"));; adding a debug statement for named blocks
                ;;  )
                (org-back-to-heading t)
                (when (looking-at org-outline-regexp)
                  (goto-char (1- (match-end 0))))
                (when (looking-at (concat " +" org-todo-regexp "\\( +\\|[ \t]*$\\)"))
                  (setq match_for_TODO_keyword (match-string 1)))))
            (unless (or (string= "no" tfile)
                        (string= "DISABLED" match_for_TODO_keyword)
                        (not (string= "emacs-lisp" lang)))
              (add-to-list 'body-list (concat "\n\n;; #####################################################################################\n"
                                              "(message \"config • " (org-get-heading) " …\")\n\n")
                           )
              (add-to-list 'body-list body)
              ))))
      (with-temp-file output-file
        (insert ";; ============================================================\n")
        (insert (concat ";; Don't edit this file, edit '" orgfile "' instead ...\n"))
        (insert ";; Auto-generated at " (format-time-string current-date-time-format (current-time)) "\n")
        (insert ";; ============================================================\n\n")
        (insert (apply 'concat (reverse body-list))))
      (message "—————• Wrote %s" output-file))))


;; following lines are executed only when jsc-tangle-config-org-hook-func()
;; was not invoked when saving config.org which is the normal case:
(dolist (jscf jsc-config-files)
  (let* ((jscfn (symbol-name jscf))
        (orgfile (concat jsc-config-org-dir jscfn ".org"))
        (elfile (concat jsc-config-el-dir jscfn ".el"))
        (gc-cons-threshold most-positive-fixnum))
    (when (or (not (file-exists-p elfile))
              (file-newer-than-file-p orgfile elfile))
      (jsc-tangle-config-org jscfn)
      ;;(save-buffers-kill-emacs);; TEST: kill Emacs when config has been re-generated due to many issues when loading newly generated config.el
      )
    (load-file elfile)))

;; when config.org is saved, re-generate config.el:
(defun jsc-tangle-config-org-hook-func ()
  (message "Hook run!")
  (message (file-name-directory buffer-file-name))
  (message jsc-config-org-dir)
  (when (string= (file-name-directory buffer-file-name) jsc-config-org-dir)
    (jsc-tangle-config-org (file-name-base buffer-file-name))))
(add-hook 'after-save-hook 'jsc-tangle-config-org-hook-func)


(message "→★ loading init.el in %.2fs" (float-time (time-subtract (current-time) jsc-init-el-start-time)))





(provide 'init)
;;; init.el ends here
