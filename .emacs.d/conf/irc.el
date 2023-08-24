;; https://danmehic.com/comms-within-emacs-irc-setting-up-erc-and-gpg/
;; (erc-status-sidebar-open)

(setq erc-user-full-name "mickael-kerjean")
(setq erc-email-userid "mickael@kerjean.me")

(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))

(setq
 erc-prompt (lambda () (concat "[" (buffer-name) "]"))
 erc-rename-buffers t
 erc-fill-column 90
 erc-fill-function 'erc-fill-static
 erc-fill-static-center 15)

 (setq erc-autojoin-channels-alist '(("libera.chat" "#emacs" "#filestash" "#filestash-dev")))

(defun my/irc-filestash (&optional arg)
  (interactive "P")
  (erc :server "irc.libera.chat" :port 6667 :nick "mickaelk"))

;; (add-hook 'erc-mode-hook 'erc-bufbar-mode)
;; (erc-nickbar-mode)
