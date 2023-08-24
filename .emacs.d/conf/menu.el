(require 'mini-frame)
(setq mini-frame-handle-completions nil)
(add-to-list 'mini-frame-ignore-commands 'execute-extended-command)
(setq mini-frame-ignore-functions '(y-or-n-p read-string))
(setq x-gtk-resize-child-frames 'resize-mode)
(mini-frame-mode t)

(custom-set-variables
 '(mini-frame-show-parameters
   `((top . 0.4)
     (width . ,(min (- (frame-width) 10) 90))
     (left . 0.5))))
