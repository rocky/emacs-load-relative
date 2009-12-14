(require 'cl)
(require 'test-unit)
(load-file "../load-relative.el")

(test-unit-clear-contexts)

(context "load-relative-list"
	 (tag load-relative-list)
	 (if (featurep 'require-file1)
	     (unload-feature 'require-file1))
	 (specify "relative-relative-list"
		  (require-relative-list '("./require-file1"))
		  (assert-t (featurep 'require-file1))
		  )

)

(test-unit "load-relative-list")
