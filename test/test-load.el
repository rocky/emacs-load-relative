(require 'cl)
(load-file "./behave.el")
(load-file "../load-relative.el")

(provide 'test-load)
(behave-clear-contexts)

(context "load-relative"
	 (tag load-relative)
	 (specify "Basic load-relative"
		  (dolist (file-name 
			   '("load-file1.el" "./load-file1.el" "../test/load-file1.el"))
		    (setq loaded-file nil)
		    (assert-equal t (load-relative file-name 'test-load))
		    (assert-equal "load-file1" loaded-file)
		    )
		  
		  (setq loaded-file nil)
		  (assert-equal t (load-relative "load-file2" 'test-load))
		  (assert-equal "load-file3" loaded-file 'test-load))
)

(behave "load-relative")

