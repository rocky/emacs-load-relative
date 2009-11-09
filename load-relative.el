(provide 'load-relative)
(defun __FILE__ (symbol)
  "Return the string name of file of the currently running Emacs Lisp program,
or nil.

SYMBOL should be some symbol defined in the file, but it is not
used if Emacs is currently running `load' of a file. The simplest
thing to do is call `provide' prior to this and use the value
given for that for SYMBOL. For example:
  (provide 'something)
  (__FILE__ 'something)
"
  (cond 
     (load-file-name)
     ((symbol-file symbol))
     (t nil)))

(defun load-relative (file-or-list symbol)
  "Load an Emacs Lisp file relative to some other currently loaded Emacs 
Lisp file. 

FILE-OR-LIST is Emacs Lisp either a string or a list of strings
containing files that you want to loaded. SYMBOL should a symbol
defined another Emacs Lisp file that you want FILE loaded relative
to. If this is called inside a `load', then SYMBOL is ignored and
`load-file-name' is used instead."

  (let ((prefix (file-name-directory (or (__FILE__ symbol) "./"))))
    (if (listp file-or-list)
	(mapcar (lambda(file) (load (concat prefix file))) file-or-list)
      (load (concat prefix file-or-list)))))

