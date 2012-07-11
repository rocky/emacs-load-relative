(require 'cl)
(require 'test-simple)
(load-file "../load-relative.el")

(test-simple-start)

;; (setq tempbuf (generate-new-buffer "*cmdbuf-test*"))
;; (assert-nil
;;  (with-current-buffer tempbuf
;;    (insert "(__FILE__)\n")
;;    (eval-current-buffer))
;;  (kill-buffer tempbuf) "(__FILE__) on temporary buffer")

(assert-equal "test-load"
	      (file-name-sans-extension
	       (file-name-nondirectory (__FILE__)))
	      "(__FILE__) on this running program"
	      )

(dolist (file-name 
	 '("load-file1.el" "./load-file1.el" "../test/load-file1.el"))
  (assert-equal 
   (expand-file-name file-name)
   (relative-expand-file-name file-name))
  "relative-expand-filename"
)

(note "Basic load-relative")
(setq loaded-file nil)
(assert-equal t (load-relative "load-file2"))
(assert-equal "load-file3" loaded-file)

(setq loaded-file nil)
(setq loaded-file1 nil)
(assert-equal '(t t) 
	      (load-relative '("load-file1" "load-file2")
			     ))
(assert-equal 't loaded-file1)
(assert-equal "load-file3" loaded-file)


(dolist (file-name 
	 '("load-file1.el" "./load-file1.el" "../test/load-file1.el"))
  (setq loaded-file nil)
  (assert-equal t (load-relative file-name)
		(format "load-relative with list file %s" loaded-file))
  (assert-equal "load-file1" loaded-file
		(format "load-relative value with list file %s" loaded-file)
  ))

(if (featurep 'require-file1 t) 
    (unload-feature 'require-file1))

(require-relative "require-file1") 
(assert-t (featurep 'require-file1) "require-relative")

(if (featurep 'require-file1 t) 
	     (unload-feature 'require-file1))

(require-relative-list '("require-file1" "require-file3"))
(assert-t (and (featurep 'require-file1)
	       (featurep 'require-file3)) "require-relative-list")

(if (featurep 'my-require-file2 t)
    (unload-feature 'my-require-file2))

(require-relative-list '("require-file2") "my-")
(assert-t (featurep 'my-require-file2) "require-relative-list with prefix")


(if (featurep 'test-load t)
    (unload-feature 'test-load) "provide-me - no prefix")
(provide-me)
(assert-t (featurep 'test-load))

(if (featurep 'my-test-load t)
    (unload-feature 'my-test-load))
(provide-me "my-")
(assert-t (featurep 'my-test-load) "provide-me - prefix")

(end-tests)

