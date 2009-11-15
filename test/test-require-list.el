(require 'cl)
(load-file "./behave.el")
(load-file "../load-relative.el")

(behave-clear-contexts)

(context "load-relative-list"
	 (tag load-relative-list)
	 (if (featurep 'require-file1)
	     (unload-feature 'require-file1))
	 (specify "relative-relative-list"
		  (require-relative-list '("./require-file1"))
		  (assert-t (featurep 'require-file1))
		  )

)

(behave "load-relative-list")

