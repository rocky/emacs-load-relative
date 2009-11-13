(require 'cl)
(load-file "./behave.el")
(load-file "../load-relative.el")

(behave-clear-contexts)

(context "load-relative"
	 (tag load-relative)

	 (specify "relative-expand-filename"
		  (dolist (file-name 
			   '("load-file1.el" "./load-file1.el" "../test/load-file1.el"))
		    (assert-equal 
		     (expand-file-name file-name)
		     (relative-expand-file-name file-name))))

	 (specify "Basic load-relative"
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
		  )

	 (specify "load-relative with list"
	 	  (dolist (file-name 
	 		   '("load-file1.el" "./load-file1.el" "../test/load-file1.el"))
	 	    (setq loaded-file nil)
	 	    (assert-equal t (load-relative file-name))
	 	    (assert-equal "load-file1" loaded-file)
	 	    ))

	 (specify "require-relative"
	 	  (if (featurep 'require-file1) 
	 	      (unload-feature 'require-file1))
		  
	 	  (require-relative "require-file1") 
	 	  (assert-t (featurep 'require-file1)))

)

(behave "load-relative")

