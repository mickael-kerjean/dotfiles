;; eww
(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors t                            ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 120                               ; Fold text to 70 columns
 eww-search-prefix "https://google.com/?q=")
(setq url-user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36")
(global-set-key (kbd "C-c b") 'eww)

;; webkit
(setq xwidget-webkit-buffer-name-format "*webkit*: [%T] - %U")
(add-hook 'xwidget-webkit-mode-hook
          (lambda ()
            (setq kill-buffer-query-functions nil)
            (setq header-line-format nil)
            (local-set-key "q" (lambda () (interactive) (kill-this-buffer)))
            (local-set-key (kbd "C-t") (lambda () (interactive) (xwidget-webkit-browse-url "https://google.com" t)))
            (local-set-key (kbd "C-h") 'xwidget-webkit-browse-history)
            (local-set-key (kbd "C-e") 'xwidget-webkit-edit-mode)))

(defun browse-url-interactive-arg (prompt)
  "fix the existing emacs version by adding the current url by default"
  (let ((event (elt (this-command-keys) 0)))
    (mouse-set-point event))
  (list (read-string
         prompt
         (or
          (and transient-mark-mode mark-active
			   ;; rfc2396 Appendix E.
			   (replace-regexp-in-string
				"[\t\r\f\n ]+" ""
				(buffer-substring-no-properties
				 (region-beginning) (region-end))))
          (xwidget-webkit-uri (xwidget-webkit-current-session))
		  (browse-url-url-at-point)))
	    (not (eq (null browse-url-new-window-flag)
		         (null current-prefix-arg)))))



;; (require 'hydra)

;; (defun my/browser-open-at-point (&optional arg)
;;   (interactive)
;;   (let ((url (thing-at-point 'url)))
;;     (xwidget-webkit-browse-url
;;      (if url url (read-string "url: " "")) t)))

;; (defun my/browser-google (&optional arg)
;;   (interactive)
;;   (xwidget-webkit-browse-url
;;    (concat "https://google.com/search?q=" (string-replace " " "%20" (read-string "search: " ""))) t))

;; (defhydra hydra-internet (:color blue :hint nil)
;;   "
;; webkit    : _o_pen _g_oogle _h_n
;; filestash : _c_ontact c_a_lendar #_f_ilestash #filestash-_d_ev
;; "
;;   ("o" (my/browser-open-at-point))
;;   ("g" (my/browser-google))
;;   ("h" (xwidget-webkit-browse-url "http://news.ycombinator.com" t))
;;   ("c" (eww "https://pages.kerjean.me/projects/filestash/logs/?key=mickael"))
;;   ("a" (xwidget-webkit-browse-url "https://calendar.google.com/calendar/u/0/r" t))
;;   ("f" (eww "https://support.filestash.app"))
;;   ("d" (eww "https://support.filestash.app/logs/%23filestash-dev/")))

;; (global-set-key (kbd "C-c o") 'hydra-internet/body)
