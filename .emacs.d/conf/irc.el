(defun my/irc-filestash (&optional arg)
  (interactive "P")
  (erc :server "irc.libera.chat" :port 6667 :nick "mickaelk"))


(setq
 erc-user-full-name "mickael-kerjean"
 erc-email-userid "mickael@kerjean.me"
 erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
 erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477")
 erc-autojoin-channels-alist '(("libera.chat" "#emacs" "#filestash" "#filestash-dev"))
 erc-prompt (lambda () (concat "[" (buffer-name) "]"))
 erc-rename-buffers t
 erc-fill-column 90
 erc-fill-function 'erc-fill-static
 erc-fill-static-center 15
 erc-status-sidebar-width 23)

(add-hook 'erc-mode-hook 'erc-status-sidebar-open)
