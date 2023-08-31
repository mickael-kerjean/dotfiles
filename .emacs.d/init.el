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
(set-face-attribute 'default nil :font "Monaco" :height 110)

(load-theme 'wombat)

;; inspired by tomorrow and wombat
(setq my/theme-dark "#191919")
(setq my/theme-dark-lighter "#35383c")
(setq my/theme-white "#e9ebea")
(setq my/theme-grey "#a7a8a7")
(setq my/theme-red "#dd908d")
(setq my/theme-orange "#ccc97d")
(setq my/theme-yellow "#cee482")
(setq my/theme-green "#a7d864")
(setq my/theme-fushia "#9ac9c4")
(setq my/theme-blue "#8bc4ee")
(setq my/theme-green-dark "#8c9c60") ;; #758250


;; ;; light theme
;; (setq my/theme-dark "#fafafa")
;; (setq my/theme-dark-lighter "#57595a")
;; (setq my/theme-white "#313538")
;; (setq my/theme-red "#f26d6d")
;; (setq my/theme-green "#63d9b1")
;; (setq my/theme-blue "#59b3e1")
;; (setq my/theme-grey "#466372")
;; (setq my/theme-yellow "#466372")

(set-face-attribute 'default nil :background my/theme-dark :foreground my/theme-white)
(set-face-attribute 'region nil :background my/theme-dark-lighter)

;; TODO: https://macowners.club/posts/from-ivy-to-vertico/
(set-face-attribute 'font-lock-warning-face nil :foreground my/theme-orange)
(set-face-attribute 'font-lock-keyword-face nil :foreground my/theme-blue)
(set-face-attribute 'font-lock-string-face nil :foreground my/theme-green)
(set-face-attribute 'font-lock-constant-face nil :foreground my/theme-red)
(set-face-attribute 'font-lock-function-name-face nil :foreground my/theme-yellow)
(set-face-attribute 'font-lock-type-face nil :foreground my/theme-green-dark)
(set-face-attribute 'font-lock-comment-face nil :foreground my/theme-grey)

(set-face-attribute 'link nil :foreground my/theme-fushia)
(set-face-attribute 'fringe nil :background my/theme-dark)
(set-face-attribute 'window-divider nil :foreground my/theme-dark)
(set-face-attribute 'window-divider-last-pixel nil :foreground my/theme-dark-lighter)
(set-face-attribute 'window-divider-first-pixel nil :foreground my/theme-dark-lighter)
(set-face-attribute 'header-line nil :foreground my/theme-grey :background my/theme-dark-lighter :box nil :slant 'italic)
(set-face-attribute 'highlight nil :underline nil)
(set-face-attribute 'shadow nil :foreground my/theme-grey)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit font-lock-keyword-face))))
 '(company-preview-common ((t (:inherit 'region :foreground "#a7a8a7"))))
 '(company-scrollbar-bg ((t (:inherit 'region))))
 '(company-scrollbar-fg ((t (:inherit nil :background "#a7a8a7"))))
 '(company-tooltip ((t (:inherit 'region))))
 '(company-tooltip-annotation ((t (:inherit font-lock-comment-face))))
 '(company-tooltip-common ((t (:inherit font-lock-default-face))))
 '(company-tooltip-selection ((t (:inherit 'region :foreground "#97b6cd"))))
 '(compilation-face ((t (:inherit 'font-lock-keyword-face))))
 '(compilation-info ((t (:inherit 'font-lock-keyword-face))))
 '(dired-directory ((t (:inherit 'font-lock-keyword-face))))
 '(dired-header ((t (:inherit 'font-lock-warning-face))))
 '(erc-current-nick-face ((t (:inherit 'font-lock-keyword-face))))
 '(erc-direct-message-face ((t (:inherit 'font-lock-warning-face))))
 '(erc-direct-msg-face ((t (:inherit 'font-lock-warning-face))))
 '(erc-err-face ((t (:inherit 'font-lock-comment-face))))
 '(erc-error-face ((t (:inherit 'font-lock-warning-face))))
 '(erc-input-face ((t (:inherit 'default))))
 '(erc-my-nick-face ((t (:inherit 'default))))
 '(erc-nick-default-face ((t (:inherit 'font-lock-comment-face))))
 '(erc-nick-msg-face ((t (:inherit 'font-lock-comment-face))))
 '(erc-notice-face ((t (:inherit 'font-lock-comment-face))))
 '(erc-prompt-face ((t (:inherit 'font-lock-keyword-face))))
 '(erc-timestamp-face ((t (:inherit 'default))))
 '(eshell-ls-archive ((t (:inherit 'font-lock-constant-face :foreground nil))))
 '(eshell-ls-backup ((t (:inherit 'font-lock-comment-face))))
 '(eshell-ls-directory ((t (:inherit 'font-lock-keyword-face))))
 '(eshell-ls-executable ((t (:inherit font-lock-constant-face :weight bold))))
 '(eshell-ls-missing ((t (:inherit 'font-lock-warning-face))))
 '(eww-valid-certificate ((t (:inherit 'font-lock-comment-face))))
 '(flymake-error ((t (:inherit nil :underline (:color "#e5786d" :style wave :position wave)))))
 '(gnus-cite-1 ((t (:inherit font-lock-comment-face))))
 '(gnus-cite-2 ((t (:inherit font-lock-comment-face))))
 '(gnus-cite-attribution ((t (:inherit font-lock-comment-face :slant italic))))
 '(gnus-group-mail-1 ((t (:inherit 'font-lock-default-face))))
 '(gnus-group-mail-1-empty ((t (:inherit 'default))))
 '(gnus-group-mail-2 ((t (:inherit 'font-lock-default-face))))
 '(gnus-group-mail-2-empty ((t (:inherit 'default))))
 '(gnus-group-mail-3 ((t (:foreground nil :weight bold))))
 '(gnus-group-mail-3-empty ((t (:inherit 'font-lock-default-face))))
 '(gnus-group-news-3 ((t (:inherit 'default :foreground nil :weight bold))))
 '(gnus-header-content ((t (:foreground nil :weight normal))))
 '(gnus-header-from ((t (:inherit default :foreground nil :weight normal))))
 '(gnus-header-subject ((t (:inherit 'default :foreground nil))))
 '(gnus-summary-cancelled ((t (:inherit 'font-lock-builtin-face))))
 '(gnus-summary-normal-ancient ((t (:inherit 'default))))
 '(gnus-summary-normal-read ((t (:inherit 'font-lock-comment-face))))
 '(gnus-summary-normal-ticked ((t (:inherit 'font-lock-warning-face))))
 '(gnus-summary-selected ((t (:inherit 'font-lock-comment-face :underline nil))))
 '(hl-line ((t (:inherit 'region :underline nil))))
 '(ido-first-match ((t (:inherit 'font-lock-comment-face))))
 '(ido-only-match ((t (:inherit 'font-lock-comment-face))))
 '(ido-subdir ((t (:inherit 'font-lock-keyword-face))))
 '(message-header-other ((t (:inherit 'default :foreground nil))))
 '(message-header-subject ((t (:inherit 'default :foreground nil))))
 '(message-header-to ((t (:inherit 'default :foreground nil))))
 '(message-separator ((t (:inherit font-lock-comment-face :foreground nil :weight bold))))
 '(mode-line ((t (:inherit 'default :background "#35383c" :foreground "#eaebec" :reverse-video nil :overline nil :box (:line-width (1 . 2) :color "#35383c")))))
 '(mode-line-inactive ((t (:inherit 'default :foreground "#a4a9af" :background "#35383c" :overline nil :box (:line-width (1 . 2) :color "#35383c")))))
 '(success ((t (:inherit 'font-lock-keyword-face))))
 '(variable-pitch ((t (:inherit 'default) :background nil)))
 '(xref-file-header ((t (:inherit 'font-lock-builtin-face)))))


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

;; remove whitespace before saving
(add-hook 'before-save-hggook 'whitespace-cleanup)

;; faster to quit
(fset 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions nil)
(global-set-key (kbd "C-x C-c") 'kill-emacs)

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
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'before-save-hook '(lamdba () (require 'saveplace)(setq-default save-place t)))

;; refresh buffers when any file change
(global-auto-revert-mode t)

;; display time
(load "time" t t)
(display-time)

;; track recently opened file
(recentf-mode t)
(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 50)
(global-set-key (kbd "C-x C-r") '(lambda () (interactive)(find-file (ido-completing-read "Find recent file: " recentf-list))))

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
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)

;; disable backup files
(setq make-backup-files nil)

;; auto wraping
(set-default 'truncate-lines t)
(add-hook 'text-mode-hook (lambda () (setq truncate-lines nil)))

;; remove stupid shortcut
(global-unset-key (kbd "C-x C-l"))

;; setup ido for selecting file
(ido-mode)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq resize-mini-windows t)
(setq ido-decorations '("\n-> " "" "\n   " "\n   ..."
            "[" "]" " [No match]" " [Matched]"
            " [Not readable]" " [Too big]" " [Confirm]"))

(setq ido-ignore-modes (list "minibuffer-inactive-mode" "messages-buffer-mode" "completion-list-mode" "Buffer-menu-mode" "special-mode" "help-mode" "debugger-mode" "fundamental-mode" "lisp-interaction-mode" "erc-mode" "erc-status-sidebar-mode" "magit-status-mode"))
(setq ido-ignore-buffers (list "\\` " #'(lambda (name) (member (symbol-name (with-current-buffer name major-mode)) ido-ignore-modes))))

(add-hook 'minibuffer-setup-hook (lambda () (setq truncate-lines nil)))

(defun my/ido-switch-buffer-mode (mode)
  (interactive
   (list (ido-completing-read
    "Mode: "
    (delete-dups
     (cl-remove-if-not
      (lambda (name) (not (member name ido-ignore-modes)))
      (mapcar '(lambda (name) (symbol-name (with-current-buffer name major-mode))) (buffer-list))))
    nil t)))

  (switch-to-buffer (ido-completing-read
   "Buffer: "
   (cl-remove-if-not
    (lambda (name) (string-match-p mode (symbol-name (with-current-buffer name major-mode))))
    (mapcar #'buffer-name (buffer-list)))
   nil t)))
(global-set-key (kbd "C-x B") 'my/ido-switch-buffer-mode)

;; other usefull shortcuts
(global-set-key (kbd "C-c s") 'eshell)
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c q") 'kill-this-buffer)

;; artist mode
(eval-after-load "artist" '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation))

;; Setup the package manager
(defun load-package-manager ()
  (package-initialize)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
(add-hook 'after-init-hook 'load-package-manager)

;; Window split line
(setq window-divider-default-right-width 20)
(window-divider-mode 1)

;; modeline
(defun my/mode-line-render (left right)
  (let* ((available-width (- (window-max-chars-per-line) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(setq-default mode-line-format
              '((:eval (my/mode-line-render
                        (format-mode-line (if (and (not buffer-read-only) (mode-line-window-selected-p)) "%b | L%l C%C" "%b"))
                        (format-mode-line (if (mode-line-window-selected-p) (format-time-string "%H:%M") " "))))))
(setq header-line-format nil)
(set-fringe-mode '(10 . 20))

;; remove fringe on various modes
(defun fringe-disabled ()
  (interactive)
  (setq-local left-fringe-width 0)
  (setq-local right-fringe-width 0)
  (set-window-buffer (selected-window) (current-buffer)))

(add-hook 'xwidget-webkit-mode-hook #'fringe-disabled)

;; better default for pdf reading
(setq pdf-view-use-scaling t)
(setq doc-view-resolution 300)


;; -------------------------------------------------------------------------------------
;; ---------------------      PLUGINS          -----------------------------------------
;; -------------------------------------------------------------------------------------

;; Our plugins configuration will leave under the conf folder, so let's load this up:
(mapc
 (lambda(path) (load-file path))
 (condition-case nil
     (directory-files "~/.emacs.d/conf/" t "\.el$")
   (error (make-directory "~/.emacs.d/conf/"))))

;; -------------------------------------------------------------------------------------
;; ---------------------      VARIABLES        -----------------------------------------
;; -------------------------------------------------------------------------------------
;;
