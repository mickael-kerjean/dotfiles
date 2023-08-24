;; terminal
;; (autoload 'vterm "vterm" "vterm" t)
;; (require 'vterm)
;; (setq vterm-buffer-name "term: %s")

;; autocompletion
(require 'lsp-mode)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-ui-doc-enable nil)

(setq
 company-format-margin-function nil
 company-minimum-prefix-length 1
 company-idle-delay 0.0
 ;; company-auto-complete 'company-explicit-action-p
 company-tooltip-minimum-width 40)


;; seen from the doc
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq
 lsp-ui-doc-background "#1c1c1c"
 lsp-ui-doc-border "#1c1c1c"
 lsp-ui-doc-enable nil
 lsp-ui-imenu-enable nil
 lsp-ui-peek-enable nil
 lsp-ui-sideline-enable nil)



(custom-set-faces
 '(company-tooltip ((t (:inherit default :background "#1e1e1e"))))
 '(company-scrollbar-bg ((t (:background "#1e1e1e"))))
 '(company-scrollbar-fg ((t (:background "#2b2b2b"))))
 '(company-preview-common ((t (:background "#2b2b2b" :foreground "#99968b"))))
 '(company-tooltip-selection ((t (:foreground "#8ac6f2"))))
 '(company-tooltip-common ((t (:inherit font-lock-default-face))))
 '(company-tooltip-annotation ((t (:inherit font-lock-comment-face)))))

;; git
(global-set-key (kbd "C-c g") 'magit-status)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(add-to-list 'projectile-globally-ignored-directories "node_modules" "dist")

;; roam
(setq org-roam-directory (file-truename "~/Documents/org"))

;; lsp
;; lsp-ui-doc-border
;; lsp-ui-doc-background
;; (set-face-attribute 'lsp-ui-doc-border nil :height 140)

(global-company-mode t)
