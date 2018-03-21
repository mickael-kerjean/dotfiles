(add-hook 'org-mode-hook 'org-publish-loader)

(defun org-publish-loader ()
  (setq org-publish-project-alist
        '(
          ("blog"
           :base-directory "~/Documents/org/post/"
           :base-extension "org"
           :publishing-directory "~/Documents/mickael-kerjean-me/_posts/"
           :recursive t
           :publishing-function org-md-publish-to-jekyll
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           )

          ))
  )
