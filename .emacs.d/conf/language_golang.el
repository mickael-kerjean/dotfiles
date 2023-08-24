(setenv "PATH" (concat (getenv "PATH") ":/home/mickael/Documents/go/bin:/usr/local/go/bin/"))
(setq exec-path (append exec-path '("/usr/local/go/bin")))
(setq exec-path (append exec-path '("/home/mickael/Documents/go/bin")))

(defun my/gostart ()
  (require 'lsp-mode)
  ;; Before save
  (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  ;; Jump to definition
  (local-set-key (kbd "M-.") 'godef-jump)
  ;; autocomplete
  (lsp-mode))

(add-hook 'go-mode-hook 'my/gostart)
