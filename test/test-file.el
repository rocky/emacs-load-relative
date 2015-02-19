(require 'load-relative)
(require 'ert)


(ert-deftest test-name ()
  (should
   ;; not sure how I can test the full path here because, well, I need to
   ;; resolve a relative path to do so...
   (equal
    "simple.txt"
    (let ((bf
           (find-file-noselect-relative "simple.txt")))
      (kill-buffer bf)
      (file-name-nondirectory
       (buffer-file-name bf))))))

(ert-deftest test-contents ()
  (should
   (equal
    "simple\n"
    (let* ((bf
            (find-file-noselect-relative "simple.txt"))
           (ct
            (with-current-buffer
                bf
              (buffer-string))))
      (kill-buffer bf)
      ct))))

(ert-deftest test-contents-with-relative-file ()
  (should
   (equal
    "simple\n"
    (with-relative-file
        "simple.txt"
      (buffer-string)))))
