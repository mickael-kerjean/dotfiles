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
(setq xwidget-webkit-buffer-name-format "*webkit* [%T] - %U")
(add-hook 'xwidget-webkit-mode-hook
          (lambda ()
            (setq kill-buffer-query-functions nil)
            (setq header-line-format nil)
            (local-set-key "q" (lambda () (interactive) (kill-this-buffer)))
            (local-set-key (kbd "C-t") (lambda () (interactive) (xwidget-webkit-browse-url "https://google.com" t)))
            (local-set-key (kbd "C-h") 'xwidget-webkit-browse-history)
            (local-set-key (kbd "C-e") 'xwidget-webkit-edit-mode)))


(defun my/browser-open-at-point (url)
  (interactive
   (list (let ((url (thing-at-point 'url)))
           (if (equal major-mode 'xwidget-webkit-mode)
               (read-string "url: " (xwidget-webkit-uri (xwidget-webkit-current-session)))
             (read-string "url: " url)))))
  (xwidget-webkit-browse-url url t))

(defun my/browser-google (query)
  (interactive "ssearch: ")
  (xwidget-webkit-browse-url
   (concat "https://google.com/search?q=" (string-replace " " "%20" query)) t))

(defun my/browser-bookmark (url)
  (interactive (list (completing-read
                "bookmark: "
                (list
                 ;; common
                 "https://youtube.com"
                 "https://reddit.com/r/selfhosted"
                 "https://ebay.fr"
                 "https://news.ycombinator.com"
                 "https://google.com"
                 "https://calendar.google.com"
                 ;; news
                 "https://lefigaro.fr"
                 "https://www.lindependant.fr"
                 ;; filestash
                 "https://stripe.com"
                 "https://wise.com"
                 "https://github.com/mickael-kerjean/filestash"
                 "https://console.hetzner.cloud"
                 "https://console.aws.amazon.com"
                 "https://search.google.com/search-console"
                 "https://pages.kerjean.me/projects/filestash/logs/?key=mickael"
                 "https://support.filestash.app"
                 ) nil nil "https://")))
  (xwidget-webkit-browse-url url t))

(global-set-key (kbd "C-c o o") 'my/browser-open-at-point)
(global-set-key (kbd "C-c o n") 'my/browser-bookmark)
(global-set-key (kbd "C-c o g") 'my/browser-google)

(global-set-key (kbd "C-c o f") (lambda ()
                                  (interactive)
                                  (eww (completing-read
                                        "[filestash]: "
                                        (list
                                         "https://pages.kerjean.me/projects/filestash/logs/?key=mickael"
                                         "https://support.filestash.app")
                                        nil t "https://"))))

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
