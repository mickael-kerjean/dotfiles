(mini-frame-mode t)
(setq mini-frame-handle-completions nil)
(add-to-list 'mini-frame-ignore-commands 'execute-extended-command)
(custom-set-variables
 '(mini-frame-show-parameters
   `((top . 0.4)
     (width . ,(min (- (frame-width) 10) 90))
     (left . 0.5))))
