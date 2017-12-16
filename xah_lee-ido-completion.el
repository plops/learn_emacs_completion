(require 'ido) ; part of emacs

;; this is your lang's keywords
(setq abc-keywords
      '("touch"
       "touch_start"
       "touch_end"
       "for"
       "foreach"
       "forall"
       ))

(defun abc-complete-symbol ()
  "Perform keyword completion on current symbol.
This uses `ido-mode' user interface for completion."
  (interactive)
  (let* (
         ($bds (bounds-of-thing-at-point 'symbol))
         ($p1 (car $bds))
         ($p2 (cdr $bds))
         ($current-sym
          (if  (or (null $p1) (null $p2) (equal $p1 $p2))
              ""
            (buffer-substring-no-properties $p1 $p2)))
         $result-sym)
    (when (not $current-sym) (setq $current-sym ""))
    (setq $result-sym
          (ido-completing-read "" abc-keywords nil nil $current-sym ))
    (delete-region $p1 $p2)
    (insert $result-sym)))

(global-set-key (kbd "TAB") 'abc-complete-symbol)

; foreach touch_start
