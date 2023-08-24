(setq org-todo-keywords (quote ((sequence "TODO(t)" "DOING(d)" "WAITING(w)" "|" "CANCEL(C)" "DEFERRED(F)" "DONE(D)"))))

(global-set-key (kbd "C-c o b") 'org-iswitchb)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o c") 'org-capture)

(add-hook 'org-mode-hook 'org-loader)

(defun org-loader ()
  ;; mode related settings
  (org-indent-mode nil)
  (setq truncate-lines nil)

  ;; capture & archive
  (setq org-default-notes-file "~/.emacs.d/files/default.org")
  (setq org-agenda-files (list "~/.emacs.d/files/"))
  (setq org-archive-location "~/.emacs.d/files/docs/archive.org::")
  (setq org-refile-targets (quote ((nil :maxlevel . 1) (org-agenda-files :maxlevel . 1))))
  (setq org-capture-templates
        (quote (("t" "todo" entry (file "~/.emacs.d/files/backlog.org")
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("d" "doing" entry (file "~/.emacs.d/files/backlog.org")
                 "* BREAK %?\n%U\n%a\n" :clock-in t :clock-resume t))))

  ;; design
  (defvar org-level-star (make-face 'org-level-star))
  (font-lock-add-keywords 'org-mode (list (list (concat "\\*") '(0 org-level-star t)) ))
  (set-face-attribute 'org-level-star nil :inherit 'font-lock-comment-face)
  (set-face-attribute 'org-level-1 nil :inherit 'font-lock-keyword-face :height 125)
  (set-face-attribute 'org-level-2 nil :inherit 'font-lock-keyword-face :height 125)
  (set-face-attribute 'org-level-3 nil :inherit 'font-lock-keyword-face :height 115)
  (set-face-attribute 'org-level-4 nil :inherit 'font-lock-keyword-face :height 115)
  (set-face-attribute 'org-level-5 nil :inherit 'font-lock-keyword-face :height 115)
  (set-face-attribute 'org-level-6 nil :inherit 'font-lock-keyword-face :height 115)
  (set-face-attribute 'org-link nil :inherit 'font-lock-warning-face)
  (set-face-attribute 'org-date nil :foreground (face-foreground 'font-lock-warning-face))
  (set-face-attribute 'org-tag nil :inherit 'font-lock-warning-face)

  ;; Task status and state
  (setq org-use-fast-todo-selection t)
  (add-hook 'org-after-todo-state-change-hook
            (lambda () (cond
                        ((and (org-entry-is-done-p) (org-clock-is-active)) (org-clock-out))
                        ((equal (org-get-todo-state) "DOING") (org-clock-in))
                        ((org-clock-is-active) (org-clock-out)))))

  ;; encrypt
  (require 'org-crypt)
  (require 'epa-file)
  (setq auto-save-default nil)
  (epa-file-enable)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-crypt-key nil)
  (setq auto-save-default nil)
  ;;(global-set-key (kbd "C-c d") 'org-decrypt-entry)

  ;; images
  (org-redisplay-inline-images)

  ;; org mode export
  (setq org-html-head "<meta http-equiv='X-UA-Compatible' content='IE=edge'><meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'><style>html{touch-action:manipulation;-webkit-text-size-adjust:100%}body{margin:5% auto;padding:0 25px;background:#fafeff;max-width:950px;color:#3c495a;font-weight:400;font-size:18px;line-height:25px;font-family:-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif}h1,h2,h3,h4,h5,h6{font-family:Ubuntu,'Trebuchet MS',Verdana,sans-serif;color:#586b82;padding:0;margin:15px 0 10px 0;font-size:1.05em}h2{margin:50px 0 15px 0;font-size:1.3em}h3{font-size:1.15em}h1.title{color:#343c44;padding:50px 0 50px 0;font-weight:400;font-size:2.2em;text-shadow:1px 1px 1px rgba(0,0,0,.1)}h1.title:after{content:' ';border-bottom:4px solid;width:150px;height:4px;display:block;margin:10px auto 20px auto;border-radius:2px;box-shadow:1px 1px 1px rgba(0,0,0,.1)}a{color:#3fa7ba;text-decoration:none}p{margin:15px 0 0 0;text-align:justify}img{max-width:100%;display:block;border-radius:3px}ol,ul{margin:0 0 5px 0;text-align:justify;overflow:auto}@media only screen and (max-width:600px){ul.org-ul{padding-left:20px}}ul>li>code{color:#586b82}pre{white-space:pre-wrap}pre.src:hover:before{display:inline;background:#fff;border-radius:5px;padding:0 10px;font-size:15px;border:1px solid #e2e9f0}.verse,pre,pre.src{box-shadow:none;background-color:#fff;border:1px solid #e2e9f0;color:#586b82;padding:15px;font-family:Monaco,monospace;overflow:auto;margin:6px 0;border-radius:2px}#table-of-contents{font-family:Ubuntu,'Trebuchet MS',Verdana,sans-serif;margin-bottom:50px;margin-top:50px}#text-table-of-contents ul{padding-left:30px;margin:0}#text-table-of-contents>ul{padding-left:0}#text-table-of-contents li{list-style-type:none}#text-table-of-contents a{color:#7c8ca1;text-decoration:none}table{border-color:#586b82;font-size:.95em}table thead{color:#586b82}table tbody tr:nth-child(even){background:#f9f9f9}table tbody tr:hover{background:rgba(0,0,0,0.05)!important;}table .left{text-align:left}table .right{text-align:right}.todo{font-family:inherit;color:inherit;opacity:.9}.done{color:inherit;opacity:.9}.tag{background:initial}.tag>span{background-color:#eee;font-family:monospace;padding-left:7px;padding-right:7px;border-radius:2px;float:right;margin-left:5px}#text-table-of-contents .tag>span{float:none;margin-left:0}.timestamp{color:#7c8ca1}#postamble{margin-top:100px;text-align:right;opacity:.5}#postamble p{text-align:inherit}@media print{@page{margin-bottom:3cm;margin-top:3cm;margin-left:2cm;margin-right:2cm}h1.title{padding-top:0}body{margin-top:0}}</style>")
  (setq org-html-validation-link nil)
  (setq org-html-creator-string ""))
