;; terminal
;; (autoload 'vterm "vterm" "vterm" t)
;; (require 'vterm)
;; (setq vterm-buffer-name-string "term: %s")

;; eshell
(setq eshell-buffer-name "*eshell*")
(setq eshell-banner-message "")
(setq eshell-prompt-function (lambda nil (concat
                                          (propertize (string-replace (concat (getenv "HOME") "/") "~/" (eshell/pwd))
                                                      'face `(:inherit 'font-lock-keyword-face))
                                          (propertize " # "
                                                      'face `(:inherit 'default)))))
(defun my/shell-hook ()
  (add-to-list 'eshell-visual-commands "bash")
  (setq kill-buffer-query-functions nil)
  (setq eshell-input-filter
        (lambda (str)
          (not (or
                (string= "" str)
                (string-prefix-p " " str)
                ))))
  (visual-line-mode)
  (setq eshell-scroll-to-bottom-on-input t)
  (local-set-key (kbd "C-r") 'eshell-insert-history)
  (local-set-key (kbd "C-l") 'eshell-clear)
  (local-set-key (kbd "<tab>") 'company-complete)
  (require 'company)
  (company-mode))

(add-hook 'eshell-mode-hook 'my/shell-hook)

(advice-add
 'eshell-send-input
 :before #'(lambda (&optional use-region queue-p no-newline)
             (if (not use-region) (goto-char (point-max)))))


(defun eshell-clear (&optional arg)
  (interactive)
  (let ((cmd (eshell-get-old-input)))
    (eshell-kill-input)
    (eshell/clear-scrollback)
    (eshell-reset)
    (insert cmd)))

(defun eshell-new ()
  (interactive)
  (eshell 'N))

(defun eshell-insert-history ()
  (interactive)
  (insert
   (ido-completing-read
    "(reverse-i-search)`' "
    (delete-dups (ring-elements eshell-history-ring)))))

(defun eshell-here () ;; taken from: https://www.reddit.com/r/emacs/comments/1zkj2d/advanced_usage_of_eshell/
  "Opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (file-name-directory (buffer-file-name)))
         (name   (car
                  (last
                   (split-string parent "/" t)))))
    (split-window-vertically)
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-c !") 'eshell-here)
