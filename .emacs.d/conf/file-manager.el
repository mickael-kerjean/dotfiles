(setq dired-listing-switches (if (eq system-type 'gnu/linux) "-lh --group-directories-first" "-lh"))
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)
            (hl-line-mode)
            (put 'dired-find-alternate-file 'disabled nil)
            (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))))
(defun dired-sort-toggle () ;; adapted from a link taken from emacs.org
  "This is a redefinition of the fn from dired.el. Normally,
dired sorts on either name or time, and you can swap between them
with the s key.  This function one sets sorting on name, size,
time, and extension. Cycling works the same.
"
  (setq dired-actual-switches
        (let (case-fold-search)
          (cond
           ((string-match " " dired-actual-switches) ;; contains a space
            ;; New toggle scheme: add/remove a trailing " -t" " -S",
            ;; or " -U"
            ;; -t = sort by time (date)
            ;; -S = sort by size
            ;; -X = sort by extension
            (cond
             ((string-match " -t\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -X"))
             ((string-match " -X\\'" dired-actual-switches)
              (concat
               (substring dired-actual-switches 0 (match-beginning 0))
               " -S"))
             ((string-match " -S\\'" dired-actual-switches)
              (substring dired-actual-switches 0 (match-beginning 0)))
             (t
              (concat dired-actual-switches " -t"))))
           (t
            ;; old toggle scheme: look for a sorting switch, one of [tUXS]
            ;; and switch between them. Assume there is only ONE present.
            (let* ((old-sorting-switch
                    (if (string-match (concat "[t" dired-ls-sorting-switches "]")
                                      dired-actual-switches)
                        (substring dired-actual-switches (match-beginning 0)
                                   (match-end 0))
                      ""))
                   (new-sorting-switch
                    (cond
                     ((string= old-sorting-switch "t") "S")
                     ((string= old-sorting-switch "S") "")
                     (t "t"))))
              (concat
               "-l"
               ;; strip -l and any sorting switches
               (dired-replace-in-string (concat "[-lt"
                                                dired-ls-sorting-switches "]")
                                        ""
                                        dired-actual-switches)
               new-sorting-switch))))))
  (revert-buffer))
