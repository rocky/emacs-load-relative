(require 'cl)
(require 'test-simple)
(load-file "../load-relative.el")

(test-simple-start)

(if (featurep 'require-file1)
    (unload-feature 'require-file1))
(require-relative-list '("./require-file1"))
(assert-t (featurep 'require-file1) "relative-relative-list")

(end-tests)
