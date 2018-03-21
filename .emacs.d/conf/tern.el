;; begin(tern)
(defun load-tern ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (add-to-list 'load-path "~/.emacs.d/plugins/tern/emacs")
  (add-to-list 'load-path "~/.emacs.d/plugins/deps/company-tern")
  (autoload 'tern-mode "tern.el" nil t)

  (eval-after-load 'tern
    '(progn
       (require 'company-tern)
       (setq company-tern-property-marker nil)
       (add-to-list 'company-backends 'company-tern)))

  (add-hook 'js-mode-hook (lambda () (tern-mode t))))
(add-hook 'after-init-hook 'load-tern)
;; end(tern)
