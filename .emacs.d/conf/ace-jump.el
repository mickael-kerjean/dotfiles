;; begin(ace-jump)
(add-to-list 'load-path "~/.emacs.d/plugins/ace-jump-mode")
(autoload 'ace-jump-mode "ace-jump-mode" "ace jump mode" t)
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
;; end(ace-jump)
