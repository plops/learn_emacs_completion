;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.
;; http://ergoemacs.org/emacs/elisp_keyword_completion.html

(setq xyz-keywords
      '("touch"
       "touch_start"
       "touch_end"
       "for"
       "foreach"
       "forall"
       ))

(defun xyz-completion-at-point ()
  "This is the function to be used for the hook `completion-at-point-functions'."
  (interactive)
  (let* (
         (bds (bounds-of-thing-at-point 'symbol))
         (start (car bds))
         (end (cdr bds)))
    (list start end xyz-keywords . nil )))

(define-derived-mode xyz-mode c-mode "xyz"
  "Major mode for editing xyz lang code …"
  (add-hook 'completion-at-point-functions 'xyz-completion-at-point nil 'local))

;; create file: C-x C-f 1.xyz
;; go into this mode: M-x xyz-mode 
