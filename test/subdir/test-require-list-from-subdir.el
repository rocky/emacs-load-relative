(require 'cl)
(require 'test-unit)
(load-file "../../load-relative.el")

(test-unit-clear-contexts)

(context "load-relative-list-from-subdir"
	 (tag load-relative-list-from-subdir)
	 (if (featurep 'require-file1)
	     (unload-feature 'require-file1))
	 (specify "relative-relative-list"
		  (require-relative-list '("../require-file1"))
		  (assert-t (featurep 'require-file1))
		  )

)

(test-unit "load-relative-list-from-subdir")
