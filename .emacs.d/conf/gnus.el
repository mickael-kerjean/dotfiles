(setq gnus-select-method '(nnnil ""))
(setq gnus-summary-line-format "[%U%R] %-11,11&user-date; %-32,32f %B%s (%k)\n")
(setq gnus-group-line-format "%S%p%P%5y:%B%(%g%)\n")
(setq gnus-user-date-format-alist
        '(((gnus-seconds-today) . "Tod. %R")
          ((+ (* 60 60 24) (gnus-seconds-today)) . "Yest %R")
          ((+ (* 5 60 60 24) (gnus-seconds-today)) . "%a. %R")
          (t . "%d/%m/%Y")))
(setq mm-text-html-renderer 'gnus-w3m)
(setq gnus-novice-user nil)
(setq gnus-expert-user t)
(setq gnus-sum-thread-tree-single-leaf "\\")

(add-hook 'gnus-group-mode-hook #'gnus-topic-mode)
(add-hook 'gnus-summary-mode-hook #'hl-line-mode)
(add-hook 'gnus-summary-mode-hook (lambda () (local-set-key (kbd "<delete>") #'gnus-summary-delete-article)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; My Config
(setq gnus-secondary-select-methods '((nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-stream ssl)
                (nnimap-list-pattern ("INBOX"))
                (nnir-search-engine imap)
                (nnimap-authinfo-file "~/.authinfo"))
        (nnimap "perso"
                (nnimap-address "ssl0.ovh.net")
                (nnimap-stream ssl)
                (nnimap-list-pattern ("INBOX"))
                (nnir-search-engine imap)
                (nnimap-authinfo-file "~/.authinfo"))
        (nnimap "filestash"
                (nnimap-address "imappro.zoho.com.au")
                (nnimap-stream ssl)
                (nnimap-list-pattern ("INBOX"))
                (nnir-search-engine imap)
                (nnimap-authinfo-file "~/.authinfo"))
        ))



(setq smtpmail-servers-requiring-authorization ".*"
      smtpmail-debug-info nil
      message-send-mail-function 'smtpmail-send-it)

(defun my/mail-pro ()
  (interactive)
  (setq user-mail-address "support@filestash.app"
        user-full-name "Filestash"
        smtpmail-smtp-server "smtp.zoho.com.au"
        smtpmail-smtp-service 465
        smtpmail-stream-type 'ssl))

(defun my/mail-perso ()
  (interactive)
  (setq user-mail-address "mickael@kerjean.me"
        user-full-name "Mickael Kerjean"
        smtpmail-smtp-server "ssl0.ovh.net"
        smtpmail-smtp-service 465
        smtpmail-stream-type 'ssl))


(my/mail-pro)
