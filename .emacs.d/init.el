;; -------------------------------------------------------------------------------------
;; ---------------------      INITIALIZE       -----------------------------------------
;; -------------------------------------------------------------------------------------

;; SETUP YOUR PROXY IF NEEDED
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;         ("http" . "company.com:8080")
;;         ("https" . "company.com:8080")))



;; -------------------------------------------------------------------------------------
;; ----------------------------    THEME     -------------------------------------------
;; -------------------------------------------------------------------------------------

(load-theme 'wombat)
;; a great font: https://www.fontyukle.net/en/Monaco.ttf
(condition-case nil
    (set-default-font "Monaco")
  (error nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :foundry "APPL" :family "Monaco"))))
 '(company-scrollbar-bg ((t (:background "#303030"))))
 '(company-scrollbar-fg ((t (:background "#99968b"))))
 '(company-tooltip ((t (:background "#303030"))))
 '(company-tooltip-annotation ((t (:inherit (quote font-lock-comment-face)))))
 '(company-tooltip-common ((t (:inherit (quote font-lock-comment-face)))))
 '(company-tooltip-common-selection ((t (:inherit (quote font-lock-keyword-face) :weight normal))))
 '(company-tooltip-mouse ((t (:inherit (quote font-lock-keyword-face) :weight normal))))
 '(company-tooltip-selection ((t (:inherit (quote font-lock-keyword-face) :weight normal))))
 '(dired-directory ((t (:inherit (quote font-lock-keyword-face)))))
 '(dired-header ((t (:inherit (quote font-lock-comment-face)))))
 '(font-lock-keyword-face ((t (:foreground "#86b7dd"))))
 '(font-lock-string-face ((t (:foreground "#98dc5f"))))
 '(fringe ((t (:background "#242424"))))
 '(ido-first-match ((t (:inherit (quote font-lock-comment-face)))))
 '(ido-only-match ((t (:inherit (quote font-lock-comment-face)))))
 '(ido-subdir ((t (:inherit (quote font-lock-keyword-face)))))
 '(linum ((t (:inherit (shadow default) :background "#191919" :foreground "#505050"))))
 '(success ((t (:inherit (quote font-lock-keyword-face) :weight normal))))
 '(vertical-border ((t (:foreground "#303030")))))


;; -------------------------------------------------------------------------------------
;; ---------------------    ENHANCEMENTS     -------------------------------------------
;; -------------------------------------------------------------------------------------

;; remove unecessary UI
(menu-bar-mode -1)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; faster to quit
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight selected text
(transient-mark-mode t)

;; set path
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin")

;; display matching parenthesis
(show-paren-mode 1)

;; move faster up and down faster
(global-set-key (kbd "M-n") (kbd "C-u 5 C-n"))
(global-set-key (kbd "M-p") (kbd "C-u 5 C-p"))

;; usefull stuff before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'before-save-hook '(lamdba () (require 'saveplace)(setq-default save-place t)))

;; refresh buffers when any file change
(global-auto-revert-mode t)

;; display time
(load "time" t t)
(display-time)

;; track recently opened file
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 50)

;; display pictures and other compressed files
(setq auto-image-file-mode t)
(setq auto-compression-mode t)

;; line and column numbering
(column-number-mode 1)
(line-number-mode 1)

;; code folding
(global-set-key (kbd "C-c C-d") 'hs-hide-all)
(global-set-key (kbd "C-c C-f") 'hs-show-all)
(global-set-key (kbd "C-c C-c") 'hs-toggle-hiding)
(add-hook 'prog-mode-hook #'(lambda () (hs-minor-mode t) ))

;; Search using regexp
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)

;; Usable on OSX and windows
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)
(setq mac-right-option-modifier 'super)
(setq w32-get-true-file-attributes nil)
(setq vc-handled-backends nil)
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; scroll
(setq scroll-step 1)
(setq scroll-conservatively 10)
(setq scroll-margin 7)
(setq scroll-conservatively 5)

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq standard-indent 4)
(setq indent-line-function 'insert-tab)
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)

;; disable backup files
(setq make-backup-files nil)

;; auto wraping
(set-default 'truncate-lines t)
(add-hook 'text-mode-hook (lambda () (setq truncate-lines nil)))

;; setup ido for selecting file
(ido-mode)
(setq ido-enable-flex-matching t)
(setq resize-mini-windows t)
(add-hook 'minibuffer-setup-hook
      (lambda () (setq truncate-lines nil)))
(setq ido-decorations '("\n-> " "" "\n   " "\n   ..."
            "[" "]" " [No match]" " [Matched]"
            " [Not readable]" " [Too big]" " [Confirm]"))
(add-to-list 'ido-ignore-buffers "*Messages*")
(add-to-list 'ido-ignore-buffers "*Buffer*")
(add-to-list 'ido-ignore-buffers "*ESS*")
(add-to-list 'ido-ignore-buffers "*NeoTree*")
(add-to-list 'ido-ignore-buffers "*Completions*")
(add-to-list 'ido-ignore-buffers "*Help*")



;; line wrap
(setq linum-format "%d ")
;;(global-linum-mode 1)

;; usefull shortcuts
(global-set-key [f3] 'comment-region)
(global-set-key [f4] 'uncomment-region)
(global-set-key [f5] 'eshell)
(global-set-key [f11] 'toggle-frame-fullscreen)
(global-set-key (kbd "C-h C-s") 'info-apropos)

;; ARTIST MODE
(eval-after-load "artist" '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation))

;; EWW - emacs web browser
(setq eww-search-prefix "https://www.google.com.au/search?q=")
(setq shr-color-visible-luminance-min 78) ;; improve readability (especially for google search)
(setq url-user-agent "User-Agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7\n")
(global-set-key (kbd "C-c b") 'eww)

;; Setup the package manager
(defun load-package-manager ()
  (package-initialize)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
(add-hook 'after-init-hook 'load-package-manager)



;; Hide left line indicator
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil) ;; no continuation indicators
      ;; '(nil right-curly-arrow) ;; right indicator only
      ;; '(left-curly-arrow nil) ;; left indicator only
      ;; '(left-curly-arrow right-curly-arrow) ;; default
      )

;; -------------------------------------------------------------------------------------
;; ---------------------      PLUGINS          -----------------------------------------
;; -------------------------------------------------------------------------------------

;; Our plugins configuration will leave under the conf folder, so let's load this up:
(mapc
 (lambda(path) (load-file path))
 (condition-case nil
     (directory-files "~/.emacs.d/conf/" t "\.el$")
   (error (make-directory "~/.emacs.d/conf/"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nyan-mode php-mode rjsx-mode wanderlust org-redmine))))
